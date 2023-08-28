class Tag < ApplicationRecord
  has_many :outfits, dependent: :destroy
  validates :temperature, :rain, :wind, presence: true
end
