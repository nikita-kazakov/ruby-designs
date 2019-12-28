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
movie3 = Movie.new("Cast Away", "PG", 95)

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
# Think about it...select works on arrays. Queue is not an array.
# long_movies = queue.select{|m| m.duration > 100}

#However, the select method is actually defined in the ennumerable module!
#Let's include it in our movie queue class!

class MovieQueue
  include Enumerable    #Now we can use select!
  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  # def each
  #   @movies.each{|movie| yield movie}
  # end

  def each_pg_movie
    pg_movies = @movies.select{|m| m.rating == "PG"}
    pg_movies.each{|m| yield m}
  end

  def each_by_rating(rating)
    @movies.select{|m| m.rating == rating}.each {|m| yield m}
  end
end

long_movies = queue.select{|m| m.duration > 100} #This works.

space
space

#Okay, recap. This might have seen confusing but let me break it down in
#another example.

#Let's use cars and sort them by types

#Create a car factory.
class Car
  attr_reader :make, :year, :type

  def initialize(make, year, type)
    @make = make
    @year = year
    @type = type
  end

  def to_s
    puts "#{make} - #{year} - #{type}"
  end

end

#create cars and store in array.
cars = [
    Car.new("Honda", 1990, "Sedan"),
    Car.new("Toyota", 2003, "Sedan"),
    Car.new("Tesla", 2019, "Electric")
]

#create garage factory.
class Garage
  attr_reader :name

  def initialize(name)
    @name = name
    @cars = []
  end

  def add_cars(car_array)
    car_array.each {|car| @cars << car}
  end

end

#Add cars to sedan_garage
sedan_garage = Garage.new("Sedan")
sedan_garage.add_cars(cars)

#Now let's say you want to cycle through the cars in the sedan garage.
#How could you do that?

#Method #1 - Most straight forward I think.
#I could create an attr_reader :cars.
class Garage
  attr_reader :cars
end
p sedan_garage.cars

#Since the #cars method returns an array, you have access to ALL the ennumerables.
sedan_garage.cars.each do |car|
  puts "#{car.make}"
end

#There you go. No need for blocks...Hmm...
p sedan_garage.cars.select {|c| c.type == "Sedan"}
