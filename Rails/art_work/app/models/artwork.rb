# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :text             not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord

  validates :title, :image_url, presence: true
  validates :artist_id, uniqueness: { scope: :title }

  belongs_to(
    :artist,
    class_name: :User,
    foreign_key: :artist_id,
    primary_key: :id
  )

  has_many(
    :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id,
    primary_key: :id
  )

  has_many(
    :shared_viewers,
    through: :artwork_shares,
    source: :viewers
  )

  has_many(
    :comments,
    dependent: :destroy,
    class_name: :Comment,
    foreign_key: :artwork_id,
    primary_key: :id
  )

  # like of a comment
  has_many :likes, :as => :likeable

  # every user who liked the artwork
  has_many(
    :users_liked,
    through: :likes,
    source: :user,
    # source_type: 'User'
  )

end
