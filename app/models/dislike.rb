class Dislike < ApplicationRecord
  belongs_to :disliked, polymorphic: true
  belongs_to :disliker, polymorphic: true

  validates :disliked_id, :disliker_id, presence: true
end
