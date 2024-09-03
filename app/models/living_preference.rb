class LivingPreference < ApplicationRecord
  belongs_to :preferable, polymorphic: true

  enum cleanliness: { messy: 0, moderate: 1, neat: 2 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum smoking: { non_smoker: 0, smoker: 1, social_smoker: 2 }
  enum partying: { never: 0, sometimes: 1, often: 2 }
  enum age: { undefined: 0, young: 1, middle: 2, old: 3 }
  enum furnished: { unfurnished: 0, furnished: 1 }
  enum dishwasher: { no_dishwasher: 0, has_dishwasher: 1 }
  enum washingmaschine: { no_washingmaschine: 0, has_washingmaschine: 1 }
  enum balcony: { no_balcony: 0, has_balcony: 1 }
  enum kitchen: { no_kitchen: 0, has_kitchen: 1 }
  enum bathtub: { no_bathtub: 0, has_bathtub: 1 }

  def matching_score_with(other_preference)
    score = 0
    attributes_to_compare = [
      :cleanliness, :gender, :smoking, :partying, :age,
      :furnished, :dishwasher, :washingmaschine, :balcony,
      :kitchen, :bathtub
    ]

    attributes_to_compare.each do |attribute|
      score += 1 if self.send(attribute) == other_preference.send(attribute)
    end

    score
  end

  # Validierungen schrittweise anwenden
  # ...

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
