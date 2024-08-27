class Match < ApplicationRecord
  belongs_to :flatmate
  belongs_to :host

  has_many :messages, dependent: :destroy

  validates :flatmate_id, :host_id, presence: true
end
