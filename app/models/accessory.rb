class Accessory < ApplicationRecord
  ACCESS = %w[CrystalBall MagicTea Van Cat Ghost AK47 Cards OuijaBoard]

  belongs_to :psychic, optional: true
  validates :name, :price, presence: true
  validates :price, numericality: { only_integer: true }
end
