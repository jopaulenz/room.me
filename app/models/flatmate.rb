class Flatmate < ApplicationRecord
  belongs_to :user
  has_one :living_preference, as: :preferable, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_one_attached :profile_photo
  has_many :given_likes, as: :liker, class_name: 'Like'
  has_many :liked_hosts, through: :given_likes, source: :liked, source_type: 'Host'

  def suggested_hosts
    if living_preference
      Host.includes(:living_preference).sort_by do |host|
        -living_preference.matching_score_with(host.living_preference)
      end
    else
      Host.order("RANDOM()").limit(10)
    end
  end
end
