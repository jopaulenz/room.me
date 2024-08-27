class Message < ApplicationRecord
  belongs_to :match
  belongs_to :user

  validates :message, presence: true, length: { maximum: 1000 }
end
