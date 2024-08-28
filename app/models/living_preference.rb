class LivingPreference < ApplicationRecord
  belongs_to :preferable, polymorphic: true

  enum cleanliness: { messy: 0, moderate: 1, neat: 2 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum smoking: { non_smoker: 0, smoker: 1, social_smoker: 2 }
  enum partying: { never: 0, sometimes: 1, often: 2 }
  enum age: { all: 0, young: 1, middle: 2, old: 3 }

  validates :cleanliness, :gender, :smoking, :partying, presence: true
  validates :aboutme, length: { maximum: 500 }
  validates :interest, length: { maximum: 500 }
end
