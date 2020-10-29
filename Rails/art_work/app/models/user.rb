# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord

  validates :username, presence: true
  validates :username, uniqueness: true

  has_many(
    :artworks,
    class_name: :Artwork,
    foreign_key: :artist_id,
    primary_key: :id
  )

  has_many(
    :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id,
    primary_key: :id
  )

  has_many(
    :shared_artworks,
    through: :artwork_shares,
    source: :artworks
  )

end
