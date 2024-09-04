class Message < ApplicationRecord
  belongs_to :match
  belongs_to :user

  validates :message, presence: true, length: { maximum: 1000 }

  def first_name
    user.flatmate ? user.flatmate.first_name : user.host.first_name
  end
end
