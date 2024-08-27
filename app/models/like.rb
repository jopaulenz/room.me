class Like < ApplicationRecord
  belongs_to :liked, polymorphic: true
  belongs_to :liker, polymorphic: true

  validates :liked_id, :liker_id, presence: true
end
