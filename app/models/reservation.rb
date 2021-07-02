class Reservation < ApplicationRecord
  belongs_to :user, validate: true
  belongs_to :movie, validate: true
  belongs_to :seat, validate: true
  belongs_to :cinema, validate: true
end
