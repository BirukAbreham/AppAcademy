class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    # Count all of the tracks on each album by a given artist.
    tracks_count = self
      .albums.select("albums.title, COUNT(*) AS number_of_tracks")
      .joins(:tracks)
      .group("albums.id")
      .as_json
  end
end
