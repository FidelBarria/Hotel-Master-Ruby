class AddCamposParaUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :hotel_id,  :integer
    add_column :users, :username,  :string
    add_column :users, :role,  :integer
  end
end
