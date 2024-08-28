class Match < ApplicationRecord
  belongs_to :flatmate
  belongs_to :host

  has_many :messages, dependent: :destroy
end
