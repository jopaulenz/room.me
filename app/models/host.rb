class Host < ApplicationRecord
  belongs_to :user
  has_one :living_preference, as: :preferable, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many_attached :photos
  has_one_attached :profile_photo

  has_many :received_likes, as: :liked, class_name: 'Like'
  has_many :liking_flatmates, through: :received_likes, source: :liker, source_type: 'Flatmate'

  # Serialisierung der apartment_picture_urls als JSON
  serialize :apartment_picture_urls, JSON

  geocoded_by :district
  after_validation :geocode, if: :full_street_address_changed?

  before_validation :initialize_apartment_picture_urls

  def full_street_address
    "#{street}, #{city}, #{postcode}, #{country}"
  end

  def full_street_address_changed?
    street_changed? || city_changed? || postcode_changed? || country_changed?
  end

  private

  def initialize_apartment_picture_urls
    self.apartment_picture_urls ||= []
  end

  def apartment_picture_urls_length
    if apartment_picture_urls.length > 3
      errors.add(:apartment_picture_urls, "can have a maximum of 3 pictures")
    end
  end
end
