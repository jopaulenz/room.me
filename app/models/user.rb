class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flatmates, dependent: :destroy
  has_many :hosts, dependent: :destroy
  has_many :messages, dependent: :destroy

  enum role: { flatmate: 0, host: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
