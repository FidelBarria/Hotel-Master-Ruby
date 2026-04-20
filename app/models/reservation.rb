class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :guest
  has_many :payment, dependent: :destroy
end
