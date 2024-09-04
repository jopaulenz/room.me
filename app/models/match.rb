class Match < ApplicationRecord
  belongs_to :flatmate
  belongs_to :host
  has_many :messages, dependent: :destroy
  validates :flatmate_id, uniqueness: { scope: :host_id }

  def matched_user(current_user)
    flatmate == current_user.flatmate ? host : flatmate
  end

  def last_message_content
    messages.last&.message || "No messages yet"
  end
end
