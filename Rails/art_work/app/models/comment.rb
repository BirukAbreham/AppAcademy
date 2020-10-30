# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  artwork_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord

  validates :body, presence: true

  belongs_to(
    :users,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :artworks,
    class_name: :Artwork,
    foreign_key: :artwork_id,
    primary_key: :id
  )

  # like of a comment
  has_many :likes, :as => :likeable

  # every user who liked the comment
  has_many(
    :users_liked,
    through: :likes,
    source: :user,
    # source_type: 'User'
  )

end
