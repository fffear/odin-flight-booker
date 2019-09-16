class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :from_airport_id, null: false
      t.integer :to_airport_id, null: false
      t.datetime :start_datetime, null: false
      t.integer :duration, null: false

      t.timestamps
    end
  end
end
