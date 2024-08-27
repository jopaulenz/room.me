class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flatmates, dependent: :destroy
  has_many :hosts, dependent: :destroy
  has_many :messages, dependent: :destroy

  enum role: { guest: 0, host: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end
