class Psychic < ApplicationRecord
  SPEC = %w[blackMagic Voodoo KarmaBooster Visions Ghosts Tarot Divination AstralProjection EnergyMedicine]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :accessories, dependent: :destroy
  has_one_attached :photo
  validates :localisation, :hour_rate, :specialty, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:specialty, :localisation],
      associated_against: {user: [:name]},
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

# , accessory: [:name]
