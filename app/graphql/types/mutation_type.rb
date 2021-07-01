module Types
  class MutationType < Types::BaseObject
    field :logout_user, mutation: Mutations::LogoutUser
    field :login_user, mutation: Mutations::LoginUser
    field :register_user, mutation: Mutations::RegisterUser
  end
end
