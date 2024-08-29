class Dislike < ApplicationRecord
  belongs_to :disliked, polymorphic: true
  belongs_to :disliker, polymorphic: true

  validates :disliker, presence: true
  validates :disliked, presence: true

  # Sicherstellen, dass ein Disliker nur einen bestimmten Disliked einmal disliken kann
  validates :disliker_id, uniqueness: { scope: [:disliked_id, :disliked_type, :disliker_type] }
end
