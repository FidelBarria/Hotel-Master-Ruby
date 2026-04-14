class Room < ApplicationRecord
  belongs_to :hotel
  enum :occupancy_status, { vago: 0, ocupado: 1, bloqueado: 2 }
  enum :room_type, { DXKN: 0, DXTN: 1, SUTN: 2, SUKN: 3 }
  enum :housekeeping_status, { sujo: 0, limpo: 1, liberado: 2 }
end
