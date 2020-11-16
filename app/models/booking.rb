class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :psychic
end
