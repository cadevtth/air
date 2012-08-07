class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :number
      t.string  :departure_code
      t.time    :departs_at
      t.string  :arrival_code
      t.integer :distance
      t.integer :seats, :default => 0

      t.timestamps
    end
  end
end
