module Types
  class CinemaType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :available_seats, Integer, null: true
    # cinema movies field
    field :movies, [Types::MovieType], null: true
    field :movies_count, Integer, null: true
    # cinema seats field
    field :seats, [Types::SeatType], null: true
    field :seats_count, Integer, null: true

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # def available_seats
    #   object.available_seats || 10
    # end

    def movies_count
      object.movies.count
    end

    def seats_count
      object.seats.count
    end

    def available_seats
      object.max_seat - object.seats.count
    end
  end
end
