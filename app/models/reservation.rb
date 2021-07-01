class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :seat
end
