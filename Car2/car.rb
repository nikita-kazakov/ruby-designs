require 'pry'

class Car
  attr_reader :health, :name, :distance
  def initialize(name)
    @health = 100
    @name = name
    @distance = 0
  end

  def move
    @distance = @distance + rand(1..6)
  end
end

class Driver
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Game
  def initialize
    @cars = []
    @drivers = []
    @track = Track.new(100)
  end

  def add_drivers
    3.times do|n|
      @drivers << Driver.new("Driver #{n+1}")
    end
  end

  def add_cars
    3.times do|n|
      @cars << Car.new("Car #{n+1}")
    end
  end

  def race
    until win?
      cars.each {|car| car.move}
      Display.new.display(@cars)
    end
  end

  def win?
    cars.any? {|car| car.distance >= 100}
  end

  def cars
    @cars
  end
end

class Display
  def initialize
  end

  def menu
    puts "Need For Speed Racing: Ruby Edition"
  end

  def display(cars)

    puts "Stats"
    cars.each do |car|
      puts "car - #{car.name} - #{car.distance} feet"
    end
    puts "|" * 100 + "Finish"
    cars.each do |car|
      puts ("-" * car.distance) + ">" + "#{car.name}"
    end
    puts "|" * 100 + "Finish"
    puts "\n\n"
    sleep 0.3
  end
end

class Track
  attr_reader :distance
  def initialize(distance=100)
    @distance = distance
  end
end

game = Game.new
game.add_drivers
game.add_cars
game.race