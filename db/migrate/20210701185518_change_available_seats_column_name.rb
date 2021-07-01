class ChangeAvailableSeatsColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :cinemas, :available_seats, :max_seat
  end
end
