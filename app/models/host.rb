class Host < ApplicationRecord
  belongs_to :user
  has_one :living_preference, as: :preferable, dependent: :destroy
  has_many :matches, dependent: :destroy

  validates :profile_picture_url, presence: true
  validates :apartment_picture_urls, presence: true, length: { maximum: 3 }

  # Ensure that apartment_picture_urls is an array
  #serialize :apartment_picture_urls, Array

  validates :city, presence: true

  geocoded_by :address
  after_validation :geocode

  def full_street_address
    "#{street}, #{city}, #{postcode}, #{country}"
  end

  def full_street_address_changed?
    street_changed? || city_changed? || postcode_changed? || country_changed?
  end
end
