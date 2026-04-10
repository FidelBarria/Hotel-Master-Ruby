class ChangeDefaultValueOccupancyStatus < ActiveRecord::Migration[8.1]
  def change
    change_column_default :rooms, :occupancy_status, from: nil, to: 0
  end
end
