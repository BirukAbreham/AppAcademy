def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .joins(:actors)
    .where('actors.name IN (:those)', those: those_actors)
    .group('movies.id, movies.title, castings.actor_id')
    .select('movies.id, movies.title')
end

def golden_age
  # Find the decade with the highest average movie score.
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  acted = Actor
            .joins(:movies)
            .where(['actors.name = ?', name])
            .select('movies.id')
            .pluck('movies.id')
  
  Actor
    .joins(:movies)
    .where(
      'movies.id IN (:coact) AND actors.name NOT LIKE (:name)', 
      coact: acted, 
      name: name
    )
    .select('actors.name')
    .pluck('actors.name')
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .left_outer_joins(:castings)
    .where('castings.ord IS NULL')
    .group('actors.id')
    .length
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  Actor
    .joins(:movies)
    .where([ 'LOWER(actors.name) LIKE LOWER(?)', "%#{whazzername}%"])
    .select('movies.*')
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  Actor
    .joins(:movies)
    .select('actors.id, actors.name, MAX(movies.yr) - Min(movies.yr) AS career')
    .group('actors.id, actors.name')
    .order('career DESC')
    .limit(3)
end
