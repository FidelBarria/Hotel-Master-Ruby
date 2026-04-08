class CreateReservations < ActiveRecord::Migration[8.1]
  def change
    create_table :reservations do |t|
      t.references :guest_id, null: false, foreign_key: true
      t.references :room_id, null: false, foreign_key: true
      t.date :check_in_date, null: false
      t.date :check_out_date, null: false
      t.integer :number_of_guest, null: false
      t.decimal :total_price, precision: 10, scale: 2
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
