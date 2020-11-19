class Psychic < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :accessories, dependent: :destroy
  has_one_attached :photo
  validates :localisation, :hour_rate, :specialty, presence: true
end
