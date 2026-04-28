class Hotel < ApplicationRecord
  has_many :user, dependent: :destroy
  has_many :room, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
