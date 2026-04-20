class Guest < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
