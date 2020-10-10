require 'securerandom'
require 'time'

class ShorthenedUrl < ApplicationRecord
  validates :long_url, :short_url, presence: true
  validates :short_url, uniqueness: true
  validate :no_spamming
  validate :nonpremium_max

  private
  def no_spamming
    if !ShorthenedUrl.all.empty?
      created_at = ShorthenedUrl.last.created_at.to_time.to_i
      now = Time.now.to_i
      if ( ShorthenedUrl.last.user_id == user_id ) && ( now - created_at < 60 )
        errors[:no_spamming] << "Please you have already submitted URL in the last one minute"
      end
    end
  end

  private
  def nonpremium_max
    if !User.find(user_id).premium && ShorthenedUrl.where(["user_id = ?", user_id]).count >= 5
      errors[:nonpremium_max] << "Please consider being a premium user, you exceeded the maximum free plan."
    end
  end

  belongs_to(
    :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  def self.random_code
    begin
      generated_short_url = SecureRandom.urlsafe_base64
      if ShorthenedUrl.exists?(:short_url => generated_short_url)
        raise "Raised Exception: duplicate short_url generated"
      else
        return generated_short_url
      end
    rescue => exception
      retry
    end
  end

  def self.create_shorthened!(user, long_url)
    generated_short = ShorthenedUrl.random_code
    ShorthenedUrl.create!(
      long_url: long_url,
      short_url: generated_short,
      user_id: user.id
    )
  end

  has_many(
    :visits,
    class_name: 'Visit',
    foreign_key: :shorthened_url_id,
    primary_key: :id
  )

  has_many(
    :visitors,
    through: :visits,
    source: :users
  )

  has_many(
    :visitors_unique,
    -> { distinct },
    through: :visits,
    source: :users
  )

  def num_clicks
    return self.visitors.count
  end

  def num_uniques
    return self.visitors_unique.count
  end

  def num_recent_uniques
  end
  
  has_many(
    :taggings,
    class_name: 'Tagging',
    foreign_key: :shorthened_url_id,
    primary_key: :id
  )

  has_many(
    :topics,
    through: :taggings,
    source: :tag_topics
  )

  def self.prune(minutes)
    last_visit = minutes*60
    now_in_second = Time.now.to_i
    all_urls = ShorthenedUrl.all
    all_urls.each do |url|
      if url.visits.exists?
        diff = now_in_second - url.visits.last.created_at.to_time.to_i
        if diff > last_visit && !User.find(url.user_id).premium
          url.destroy
        end
      else
        url.destroy if !User.find(url.user_id).premium
      end
    end
  end

end
