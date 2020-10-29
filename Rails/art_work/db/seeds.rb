# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

