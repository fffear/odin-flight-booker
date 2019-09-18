class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :flight_id, null: false

      t.timestamps
    end

    add_index :bookings, :flight_id
  end
end
