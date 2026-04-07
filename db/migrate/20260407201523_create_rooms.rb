class CreateRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :rooms do |t|
      t.integer :hotel_id
      t.string :room_number
      t.integer :room_type
      t.integer :capacity
      t.decimal :price_per_night
      t.integer :status
      t.string :description

      t.timestamps
    end
  end
end
