module Mutations
  class CreateCinema < BaseMutation
    # TODO: define return fields
    field :cinema, Types::CinemaType, null: true
    field :message, String, null: true

    # TODO: define arguments
    argument :name, String, required: true

    # TODO: define resolve method
    def resolve(name:)
      @message = ''

      if context[:current_user] && context[:admin?]
        @cinema = Cinema.create!(name: name)
        @message = 'A new cinema has been created'
        { cinema: @cinema, message: @message }
      else
        @message = 'You have to be logged in as admin before you can create cinemas'
        { cinema: nil, message: @message }
      end
    end
  end
end
