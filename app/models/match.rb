class Match < ApplicationRecord
  belongs_to :flatmate, class_name: 'User'
  belongs_to :host, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates :flatmate_id, uniqueness: { scope: :host_id }
end
