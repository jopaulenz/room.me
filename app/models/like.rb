class Like < ApplicationRecord
  belongs_to :liked, polymorphic: true
  belongs_to :liker, polymorphic: true

  validates :liker, presence: true
  validates :liked, presence: true

  # Sicherstellen, dass ein Liker nur einen bestimmten Liked einmal liken kann
  validates :liker_id, uniqueness: { scope: [:liked_id, :liked_type, :liker_type] }
end
