class Visit < ApplicationRecord
  
  def self.record_visit!(user, shorthened_url)
    Visit.create!(
      user_id: user.id,
      shorthened_url_id: shorthened_url.id
    )
  end

  belongs_to(
    :users,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :shorthened_urls,
    class_name: 'ShorthenedUrl',
    foreign_key: :shorthened_url_id,
    primary_key: :id
  )
end
