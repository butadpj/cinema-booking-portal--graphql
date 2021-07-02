module Types
  class ReservationType < Types::BaseObject
    field :id, ID, null: false
    field :time_slot, String, null: true
    field :from_user, Types::UserType, null: false, method: :user
    field :movie, Types::MovieType, null: false, method: :movie
    field :seat, Types::SeatType, null: false, method: :seat
    field :from_cinema, Types::CinemaType, null: false, method: :cinema

    

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
