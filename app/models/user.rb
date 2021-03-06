class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_one :psychic
  has_many :psychics, through: :bookings

  validates :name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
