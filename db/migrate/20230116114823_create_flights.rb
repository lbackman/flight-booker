class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :departure_airport, null: false, foreign_key: { to_table: :airports }
      t.references :arrival_airport, null: false, foreign_key: { to_table: :airports }
      t.datetime :departure_time
      t.integer :flight_duration_minutes

      t.timestamps
    end
  end
end
