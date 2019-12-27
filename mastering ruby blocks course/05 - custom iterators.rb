#December 29, 2019 - Custom Iterators

def space
  puts "\n\n"
end

#Let's say we have a simple Genre class.
#It's a collection of Genre names.
class Genres
  def initialize
    @names = ["Action", "Comedy", "Sci-Fi", "Adventure"]
  end
end

genres = Genres.new

#What we simply want to do is iterate through all Genre names.
#   genres.each {|name| puts name}
# However, that code won't work.
# Genres doesn't have an each method defined on it...


#One way to do it is to define our own each method like this. (not optimal)
class Genres
  def initialize
    @names = ["Action", "Comedy", "Sci-Fi", "Adventure"]
  end

  def each
  end
end


#Instead we can piggy back on the each method that's already available to
#@names array.
class Genres
  def initialize
    @names = ["Action", "Comedy", "Sci-Fi", "Adventure"]
  end

  def each
    @names.each{|name| yield name}
  end
end

genres.each {|name| puts name}
# Action
# Comedy
# Sci-Fi
# Adventure




#Here's another example.
#We have a movie class that generates a movie with title, rating, and duration properties.
class Movie
  attr_reader :title, :rating, :duration
  def initialize(title, rating, duration)
    @title = title
    @rating = rating
    @duration = duration
  end

  def watch
    puts "Watching #{title} - #{rating} (#{duration} minutes)"
  end
end

movie1 = Movie.new("Toy Story", "G", 81)
movie2 = Movie.new("Die Hard", "R", 95)
movie3 = Movie.new("Die Hard", "PG", 95)

#We also have a MovieQueue class that adds the movie to the queue.
class MovieQueue
  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end
end

queue = MovieQueue.new("Friday Night")
queue.add_movie(movie1)
queue.add_movie(movie2)
queue.add_movie(movie3)

#We want to be able to iterate through the movies in the Queue by calling EACH.
#Like this below:
#queue.each {|movie| movie.watch}

#Let's add an each method to queue.

class MovieQueue
  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def each
    @movies.each{|movie| yield movie}
  end
end

queue.each {|movie| movie.watch}
# Watching Toy Story - G (81 minutes)
# Watching Die Hard - R (95 minutes)

#

space

# What if we only want to queue the PG movies only?
#queue.each_pg_movie{|movie| movie.watch}

class MovieQueue
  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def each
    @movies.each{|movie| yield movie}
  end

  def each_pg_movie
    pg_movies = @movies.select{|m| m.rating == "PG"}
    pg_movies.each{|m| yield m}
  end
end

queue.each_pg_movie{|movie| movie.watch}

space
#This is great but what if we want to not hardcode the PG part and instead
#call it through a block?

class MovieQueue
  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def each
    @movies.each{|movie| yield movie}
  end

  def each_pg_movie
    pg_movies = @movies.select{|m| m.rating == "PG"}
    pg_movies.each{|m| yield m}
  end

  def each_by_rating(rating)
    @movies.select{|m| m.rating == rating}.each {|m| yield m}
  end
end

queue.each_by_rating("PG"){|movie| movie.watch}
queue.each_by_rating("R"){|movie| movie.watch}



#Let's say we want to find all the LONG movies in our queue.
# This below WONT work because queue class doesn't define the select method.
# long_movies = queue.select{|m| m.duration > 100}

