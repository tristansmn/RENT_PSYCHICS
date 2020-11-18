class Psychic < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :accessories, dependent: :destroy
end
