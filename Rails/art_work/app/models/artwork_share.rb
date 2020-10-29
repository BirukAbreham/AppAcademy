# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord

  validates :viewer_id, uniqueness: { scope: :artwork_id }

  belongs_to(
    :viewers,
    class_name: :User,
    foreign_key: :viewer_id,
    primary_key: :id
  )

  belongs_to(
    :artworks,
    class_name: :Artwork,
    foreign_key: :artwork_id,
    primary_key: :id
  )

end
