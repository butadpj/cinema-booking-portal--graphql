class ChangeAvailableSeatsTypeToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :seats, :number, :integer
  end
end
