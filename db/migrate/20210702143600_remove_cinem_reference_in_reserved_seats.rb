class RemoveCinemReferenceInReservedSeats < ActiveRecord::Migration[6.1]
  def change
    change_table :reserved_seats do |t|
      t.remove_references :cinema
    end
  end
end
