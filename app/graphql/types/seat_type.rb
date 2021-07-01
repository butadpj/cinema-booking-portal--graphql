module Types
  class SeatType < Types::BaseObject
    field :id, ID, null: false
    field :number, Integer, null: false
    field :from_cinema, Types::CinemaType, null: false, method: :cinema

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
