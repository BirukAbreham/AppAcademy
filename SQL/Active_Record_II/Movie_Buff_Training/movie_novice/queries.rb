# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer


def find_angelina
  #find Angelina Jolie by name in the actors table
  actor = Actor.where(['name = ?', 'Angelina Jolie']).first
  [ ['id', actor.id], ['name', actor.name] ]
end

def top_titles
  # get movie titles from movies with scores greater than or equal to 9
  # hint: use 'select' and 'where'
  Movie.where(['score >= 9']).select('id, title').as_json
end

def star_wars
  #display the id, title and year of each Star Wars movie in movies.
  # hint: use 'select' and 'where'
  Movie.where(['title LIKE ?', 'Star Wars%'])
    .select('id, title, yr')
    .as_json
end


def below_average_years
  #display each year with movies scoring under 5,
  #with the count of movies scoring under 5 aliased as bad_movies,
  #in descending order
  # hint: use 'select', 'where', 'group', 'order'
  Movie.where(['score < 5'])
    .select('yr, COUNT(*) AS bad_movies')
    .group(:yr)
    .order('bad_movies DESC')
    .as_json
end

def alphabetized_actors
  # display the first 10 actor names ordered from A-Z
  # hint: use 'order' and 'limit'
  # Note: Ubuntu users may find that special characters
  # are alphabetized differently than the specs.
  # This spec might fail for Ubuntu users. It's ok!
  Actor.select('id, name')
    .order('name ASC')
    .limit(10)
    .as_json
end

def pulp_fiction_actors
  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'
  Movie.joins(:actors)
    .where(['movies.title = ?', 'Pulp Fiction'])
    .select('actors.id, actors.name')
    .as_json
end

def uma_movies
  #practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'
  Actor.joins(:movies)
    .where(['name = ?', 'Uma Thurman'])
    .select('movies.id, movies.title, movies.yr')
    .order('movies.yr ASC')
    .as_json
end
