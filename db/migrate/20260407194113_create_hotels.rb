class CreateHotels < ActiveRecord::Migration[8.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :phone
      t.string :email
      t.integer :category
      t.integer :number_of_rooms

      t.timestamps
    end
  end
end
