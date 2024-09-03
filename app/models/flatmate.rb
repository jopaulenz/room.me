class Flatmate < ApplicationRecord
  belongs_to :user
  has_one :living_preference, as: :preferable, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_one_attached :profile_photo
  has_many :given_likes, as: :liker, class_name: 'Like'
  has_many :liked_hosts, through: :given_likes, source: :liked, source_type: 'Host'

  def suggested_hosts
    return [] unless living_preference

    Host.includes(:living_preference).map do |host|
      score = living_preference.matching_score_with(host.living_preference)
      { host: host, score: score }
    end.sort_by { |suggestion| -suggestion[:score] }
  end
end

