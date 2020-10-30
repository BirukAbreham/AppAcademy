# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all

user_one = User.create!({ username: 'Leonardo da Vinci' })
user_two = User.create!({ username: 'Michelangelo' })
user_th = User.create!({ username: 'Lucas' })

art_one = Artwork.create!({
  title: 'Mona Lisa',
  image_url: 'images/mona_lisa.jpg',
  artist_id: user_one.id
})

art_two = Artwork.create!({
  title: 'The Last Supper',
  image_url: 'images/the_last_supper.jpg',
  artist_id: user_one.id
})

art_thr = Artwork.create!({
  title: 'Sistine Chapel ceiling',
  image_url: 'images/sistine_chapel_ceiling.jpg',
  artist_id: user_two.id
})

art_share_one = ArtworkShare.create!({
  artwork_id: art_one.id,
  viewer_id: user_th.id
})

art_share_two = ArtworkShare.create!({
  artwork_id: art_two.id,
  viewer_id: user_th.id
})

art_share_thr = ArtworkShare.create!({
  artwork_id: art_thr.id,
  viewer_id: user_th.id
})

art_share_fr = ArtworkShare.create!({
  artwork_id: art_thr.id,
  viewer_id: user_one.id
})

art_share_fv = ArtworkShare.create!({
  artwork_id: art_one.id,
  viewer_id: user_two.id
})

comment_one = Comment.create!({
  body: 'Amazing classical artwork on the dawn of the renaissance',
  user_id: user_th.id,
  artwork_id: art_one.id
})

comment_two = Comment.create!({
  body: 'A ceiling in everyones mind',
  user_id: user_th.id,
  artwork_id: art_thr.id
})

comment_thr = Comment.create!({
  body: 'Art of the renaissance',
  user_id: user_two.id,
  artwork_id: art_two.id
})

like_one = Like.create!({
  user_id: user_th.id,
  likeable_id: art_one.id,
  likeable_type: 'Artwork'
})

like_two = Like.create!({
  user_id: user_th.id,
  likeable_id: art_two.id,
  likeable_type: 'Artwork'
})

like_thr = Like.create!({
  user_id: user_th.id,
  likeable_id: art_thr.id,
  likeable_type: 'Artwork'
})

like_fr = Like.create!({
  user_id: user_th.id,
  likeable_id: comment_thr.id,
  likeable_type: 'Comment'
})
