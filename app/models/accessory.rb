class Accessory < ApplicationRecord
  belongs_to :psychic
  validates :name, :price, :psychic, presence: true
end
