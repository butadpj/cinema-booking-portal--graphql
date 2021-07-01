module Types
  class MutationType < Types::BaseObject
    field :initialize_seats, mutation: Mutations::InitializeSeats
    field :create_seat, mutation: Mutations::CreateSeat
    field :create_movie, mutation: Mutations::CreateMovie
    field :create_cinema, mutation: Mutations::CreateCinema
    field :logout_user, mutation: Mutations::LogoutUser
    field :login_user, mutation: Mutations::LoginUser
    field :register_user, mutation: Mutations::RegisterUser
  end
end
