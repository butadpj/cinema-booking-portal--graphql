class CreateReservedSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :reserved_seats do |t|
      t.belongs_to :cinema, null: false, foreign_key: true
      t.belongs_to :seat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
