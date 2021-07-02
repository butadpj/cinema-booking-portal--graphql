class AddCinemaReferenceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :cinema, null: false, foreign_key: true
  end
end
