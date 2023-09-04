class User < ApplicationRecord
  has_many :outfits, dependent: :destroy
  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def location
  #   "Amsterdam"
  # end
end
