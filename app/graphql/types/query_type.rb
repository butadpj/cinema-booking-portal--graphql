module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false do
      description 'Query all users'
    end

    field :users_count, [Integer], null: false do
      description 'Query the total number of users'
    end

    field :current_user, Types::UserType, null: true do
      description 'Query the current logged in user'
    end

    def users
      User.all
    end

    def users_count
      User.count
    end

    def current_user
      context[:current_user]
    end
  end
end
