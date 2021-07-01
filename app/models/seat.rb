class Seat < ApplicationRecord
  belongs_to :cinema

  validates :number, presence: true
end
