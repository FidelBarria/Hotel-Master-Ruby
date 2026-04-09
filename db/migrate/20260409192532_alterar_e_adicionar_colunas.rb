class AlterarEAdicionarColunas < ActiveRecord::Migration[8.1]
  def change
    add_column :rooms, :housekeeping_status, :integer, default: 0
    rename_column :rooms, :status, :occupancy_status
  end
end
