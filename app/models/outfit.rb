class Outfit < ApplicationRecord
  attr_accessor :day

  #   belongs_to :tag
  belongs_to :user
  has_many_attached :photos

  validates :description, length: {
    maximum: 200,
    too_long: "Maximum description length is 200 characters."
  }
end
