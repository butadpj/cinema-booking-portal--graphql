class User < ApplicationRecord
  has_secure_password

  has_many :reservations, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :username, presence: true, uniqueness: true
end
