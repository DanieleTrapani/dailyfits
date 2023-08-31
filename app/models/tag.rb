class Tag < ApplicationRecord
  has_many :outfits, dependent: :destroy
  validates :temperature, :rain, :wind, presence: true
  validates_uniqueness_of :temperature, scope: %i[rain wind]
end
