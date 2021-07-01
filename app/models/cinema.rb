class Cinema < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :seats, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
