class Hotel < ApplicationRecord
  has_many :user
  has_many :room
end
