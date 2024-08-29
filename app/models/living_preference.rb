class LivingPreference < ApplicationRecord
  belongs_to :preferable, polymorphic: true

  enum cleanliness: { messy: 0, moderate: 1, neat: 2 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum smoking: { non_smoker: 0, smoker: 1, social_smoker: 2 }
  enum partying: { never: 0, sometimes: 1, often: 2 }
  enum age: { undefined: 0, young: 1, middle: 2, old: 3 }
  enum furnished: { unfurnished: 0, furnished: 1 }  # Umbenennung von not_furnished auf unfurnished
  enum dishwasher: { no_dishwasher: 0, has_dishwasher: 1 }  # Umbenennung von dishwasher auf has_dishwasher
  enum washingmaschine: { no_washingmaschine: 0, has_washingmaschine: 1 }  # Ähnliche Umbenennung
  enum balcony: { no_balcony: 0, has_balcony: 1 }
  enum kitchen: { no_kitchen: 0, has_kitchen: 1 }
  enum bathtub: { no_bathtub: 0, has_bathtub: 1 }

  # Validierungen schrittweise anwenden
  # with_options if: :step1? do
  #   validates :cleanliness, :gender, :smoking, presence: true
  # end

  # with_options if: :step2? do
  #   validates :partying, :age, :furnished, :dishwasher, presence: true
  # end

  # with_options if: :step3? do
  #   validates :washingmaschine, :balcony, :kitchen, :bathtub, presence: true
  # end

  # with_options if: :step4? do
  #   validates :aboutme, length: { maximum: 500 }
  #   validates :interest, length: { maximum: 500 }
  # end

  private

  def step1?
    @current_step == 1
  end

  def step2?
    @current_step == 2
  end

  def step3?
    @current_step == 3
  end

  def step4?
    @current_step == 4
  end
end
