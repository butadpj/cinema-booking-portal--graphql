module Mutations
  class CreateMovie < BaseMutation
    # TODO: define return fields
    field :movie, Types::MovieType, null: true
    field :message, String, null: true

    # TODO: define arguments
    argument :title, String, required: true
    argument :description, String, required: true
    argument :cinema_id, ID, required: true

    # TODO: define resolve method
    def resolve(title:, description:, cinema_id:)
      @message = ''

      if context[:current_user] && context[:admin?]
        @movie = Movie.create!(title: title, description: description, cinema_id: cinema_id)
        cinema_name = Cinema.find(cinema_id).name
        @message = "A new movie has been created for #{cinema_name}"
        { movie: @movie, message: @message }
      else
        @message = 'You have to be logged in as admin before you can create cinemas'
        { movie: nil, message: @message }
      end
    end
  end
end
