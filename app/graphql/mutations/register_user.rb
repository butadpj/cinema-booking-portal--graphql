module Mutations
  class RegisterUser < BaseMutation
    class AuthProviderRegisterData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    field :user, Types::UserType, null: false

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :auth_provider, AuthProviderRegisterData, required: true

    def resolve(first_name:, last_name:, auth_provider:)
      @user = User.create!(
        first_name: first_name,
        last_name: last_name,
        username: auth_provider&.[](:credentials)&.[](:username),
        password: auth_provider&.[](:credentials)&.[](:password)
      )

      { user: @user }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
