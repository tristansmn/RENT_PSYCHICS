class Accessory < ApplicationRecord
<<<<<<< HEAD
  belongs_to :psychic
  validates :name, :price, :psychic, presence: true
=======
  belongs_to :psychic, optional: true
>>>>>>> master
end
