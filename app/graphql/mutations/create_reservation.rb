module Mutations
  class CreateReservation < BaseMutation
    # TODO: define return fields
    field :reservation, Types::ReservationType, null: true
    field :message, String, null: true

    # TODO: define arguments
    argument :time_slot, String, required: true
    argument :movie_id, ID, required: true
    argument :seat_id, ID, required: true

    # TODO: define resolve method
    def resolve(time_slot:, movie_id:, seat_id:)
      @message = ''
      @reservation = nil
      if context[:current_user]
        @user = context[:current_user]
        seat = Seat.find(seat_id)
        movie = Movie.find(movie_id)
        cinema = nil
        @cinema = seat.cinema if seat.cinema.id == movie.cinema.id
        user_fullname = "#{@user.first_name} #{@user.last_name}"

        if !seat.reserved_seat
          @reservation = Reservation.create!(time_slot: time_slot, movie_id: movie_id, seat_id: seat_id, user: @user,
                                             cinema: @cinema)

          @message = "#{@user.username} has reserved seat ##{seat.number} from #{@cinema.name}"
          ReservedSeat.create!(seat_id: seat_id)
        else
          @message = 'The selected seat is already reserved for someone'
        end
        { reservation: @reservation, message: @message, user: @user}
      else
        @message = 'You have to be logged in before you can book a seat and a movie'
        { reservation: @reservation, message: @message }
      end
    end
  end
end
