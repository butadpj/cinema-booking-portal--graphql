module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false do
      description 'Query all users'
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    field :users_count, [Integer], null: false do
      description 'Query the total number of users'
    end

    field :current_user, Types::UserType, null: true do
      description 'Query the current logged in user'
    end
    # --------
    field :cinemas, [Types::CinemaType], null: true do
      description 'Query all cinemas'
    end

    field :cinema, Types::CinemaType, null: false do
      argument :id, ID, required: true
    end

    field :movies, [Types::MovieType], null: true do
      description 'Query all movies'
    end

    field :movie, Types::MovieType, null: false do
      argument :id, ID, required: true
    end

    field :seats, [Types::SeatType], null: true do
      description 'Query all seats'
    end

    field :seat, [Types::SeatType], null: true do
      argument :id, ID, required: true
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end

    def users_count
      User.count
    end

    def current_user
      context[:current_user]
    end

    # -------
    def cinemas
      Cinema.all
    end

    def cinema(id:)
      Cinema.find(id)
    end

    def movies
      Movie.all
    end

    def movie(id:)
      Movie.find(id)
    end

    def seats
      Seat.all
    end

    def seat(id:)
      Seat.find(id)
    end
  end
end
