class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many(
    :submitted_url,
    class_name: 'ShorthenedUrl',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: 'Visit',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :visited_urls, 
    through: :visits,
    source: :shorthened_urls
  )

  has_many(
    :visited_urls_unique,
    -> { distinct },
    through: :visits,
    source: :shorthened_urls
  )
end
