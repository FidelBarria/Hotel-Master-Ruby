class Hotel < ApplicationRecord
  has_many :user, dependent: :destroy
  has_many :room, dependent: :destroy
end
