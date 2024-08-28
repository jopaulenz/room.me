class Like < ApplicationRecord
  belongs_to :liked, polymorphic: true
  belongs_to :liker, polymorphic: true
end
