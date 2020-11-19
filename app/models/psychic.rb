class Psychic < ApplicationRecord
  SPEC = %w[blackMagic Voodoo KarmaBooster Visions Ghosts Tarot Divination AstralProjection EnergyMedicine]
  belongs_to :user
  has_many :bookings
  has_many :accessories, dependent: :destroy
  has_one_attached :photo
  validates :localisation, :hour_rate, :specialty, presence: true
end
