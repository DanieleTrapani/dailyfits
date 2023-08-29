class Outfit < ApplicationRecord
  belongs_to :tag
  has_many_attached :photos
  
  validates :description, length: {
    maximum: 200,
    too_long: "Maximum description length is 200 characters."
  }
end
