class CreateGuests < ActiveRecord::Migration[8.1]
  def change
    create_table :guests do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone
      t.string :document_number, null: false
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end

    add_index :guests, :document_number, unique: true
    add_index :guests, :email, unique: true
  end
end
