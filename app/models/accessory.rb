class Accessory < ApplicationRecord
  belongs_to :psychic, optional: true
  validates :name, :price, :psychic, presence: true
  validates :price, numericality: { only_integer: true }
  

end
