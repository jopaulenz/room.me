class Host < ApplicationRecord
  belongs_to :user
  has_one :living_preference, as: :preferable, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many_attached :photos
  has_one_attached :profile_photo

  # validates :profile_picture_url, presence: true

  # validates :apartment_picture_urls, presence: true

  # Ensure that apartment_picture_urls is an array
  serialize :apartment_picture_urls, JSON

  validates :city, presence: true

  geocoded_by :full_street_address
  after_validation :geocode, if: :full_street_address_changed?

  def full_street_address
    "#{street}, #{city}, #{postcode}, #{country}"
  end

  def full_street_address_changed?
    street_changed? || city_changed? || postcode_changed? || country_changed?
  end
end
