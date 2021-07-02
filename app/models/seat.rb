class Seat < ApplicationRecord
  belongs_to :cinema

  has_many :reservation
  has_one :reserved_seat

  validates :number, presence: true
end
