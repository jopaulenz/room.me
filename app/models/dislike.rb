class Dislike < ApplicationRecord
  belongs_to :disliked, polymorphic: true
  belongs_to :disliker, polymorphic: true
end
