class Message < ApplicationRecord
  after_create_commit :broadcast_message
  belongs_to :match
  belongs_to :user

  validates :message, presence: true, length: { maximum: 1000 }

  def first_name
    user.flatmate ? user.flatmate.first_name : user.host.first_name
  end

  private

  def broadcast_message
    broadcast_append_to "match_#{match.id}_messages",
                        partial: "messages/message",
                        locals: { message: self, user: user },
                        target: "messages"
  end
end
