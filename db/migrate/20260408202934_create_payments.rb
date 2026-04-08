class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments do |t|
      t.references :reservation_id, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.integer :payment_method, null: false
      t.date :payment_date
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
