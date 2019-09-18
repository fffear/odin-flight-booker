class CreatePassengerBookingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :passenger_booking_details do |t|
      t.integer :booking_id, null: false
      t.integer :passenger_id, null: false
      t.timestamps
    end

    add_index :passenger_booking_details, [:booking_id, :passenger_id], unique: true
    add_index :passenger_booking_details, [:passenger_id, :booking_id]

  end
end
