module Mutations
  class InitializeSeats < BaseMutation
    # TODO: define return fields
    field :seats, [Types::SeatType], null: true
    field :message, String, null: true

    # TODO: define arguments
    argument :number, Integer, required: true
    argument :cinema_id, ID, required: true

    # TODO: define resolve method
    def resolve(number:, cinema_id:)
      @message = ''
      cinema = Cinema.find(cinema_id)
      def has_available_seats?(cinema_id)
        existing_seats = Cinema.find(cinema_id).seats.count
        available = true
        available = false if existing_seats >= 10
        available
      end

      if context[:current_user] && context[:admin?]
        if has_available_seats?(cinema_id)
          n = number
          while n <= cinema.max_seat
            Seat.create!(number: n, cinema_id: cinema_id) if has_available_seats?(cinema_id)
            n += 1
          end
          if cinema.seats.count == 10
            @seats = cinema.seats
            @message = "10 new seats has been initialized for #{cinema.name}"
            { seats: @seats, message: @message }
          else
            @message = 'Maximum of 10 seats has already reached'
            { seats: [], message: @message }
          end
        else
          @message = 'Can\'t initialize seats. Cinema\'s seats is already at max capacity of 10'
          { seats: [], message: @message }
        end

      else
        @message = 'You have to be logged in as admin before you can initialize seats for a cinema'
      end
      { seats: nil, message: @message }
    end
  end
end
