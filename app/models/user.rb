class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :hotel
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, { admin: 0, supervisor: 1, operator: 2 }
end
