class Movie < ApplicationRecord
  belongs_to :cinema, validate: true
end
