class AddDefaultValueToAvailableSeatsInCinema < ActiveRecord::Migration[6.1]
  def change
    change_column :cinemas, :available_seats, :integer, default: 10
  end
end
