class LivingPreference < ApplicationRecord
  belongs_to :preferable, polymorphic: true

  enum cleanliness: { messy: 0, moderate: 1, neat: 2 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum smoking: { non_smoker: 0, smoker: 1, social_smoker: 2 }
  enum partying: { never: 0, sometimes: 1, often: 2 }
  enum age: { all: 0, young: 1, middle: 2, old: 3 }
  enum furnished: { no: 0, yes: 1 }
  enum dishwasher: { no: 0, yes: 1 }
  enum washingmaschine: { no: 0, yes: 1 }
  enum balcony: { no: 0, yes: 1 }
  enum kitchen: { no: 0, yes: 1 }
  enum bathtub: { no: 0, yes: 1 }

  validates :cleanliness, :gender, :smoking, :partying, :age, :furnished, :dishwasher, :washingmaschine, :balcony, :kitchen, :bathtub, presence: true
  validates :aboutme, length: { maximum: 500 }
  validates :interest, length: { maximum: 500 }
end
