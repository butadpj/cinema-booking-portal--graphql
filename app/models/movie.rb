class Movie < ApplicationRecord
  has_many :reservations

  belongs_to :cinema, validate: true
end
