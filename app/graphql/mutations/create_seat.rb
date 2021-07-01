module Mutations
  class CreateSeat < BaseMutation
    # TODO: define return fields
    field :seat, Types::SeatType, null: true
    field :message, String, null: true

    # TODO: define arguments
    argument :number, Integer, required: true
    argument :cinema_id, ID, required: true

    # TODO: define resolve method
    def resolve(number:, cinema_id:)
      @message = ''

      def has_available_seats?(cinema_id)
        existing_seats = Cinema.find(cinema_id).seats.count
        available = true
        available = false if existing_seats >= 10
        available
      end

      if context[:current_user] && context[:admin?]
        if has_available_seats?(cinema_id)
          @seat = Seat.create!(number: number, cinema_id: cinema_id)
          cinema = Cinema.find(cinema_id)
          cinema_name = cinema.name

          @message = "#{cinema_name} has new seat: Seat no.#{number}"
          { seat: @seat, message: @message }
        else
          @message = 'Maximum of 10 seats has already reached'
          { seat: nil, message: @message }
        end
      else
        @message = 'You have to be logged in as admin before you can create seats for a cinema'
        { seat: nil, message: @message }
      end
    end
  end
end
