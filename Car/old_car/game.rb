require_relative 'db'
require_relative 'car'
require_relative 'track'



class Game
  attr_accessor :cars, :track
  def initialize
    @cars = []
    car_add
    track_add
  end

  def car_add
    2.times do
      @cars << Car.new
    end
  end

  def track_add
    @track = Track.new
  end

  def race
    10.times do
      @cars.each do |car|
        car.move
        race_over?(car)
      end
    end
  end

  def race_over?(car)
      message = "Congratulations Car Name. It covered #{car.distance_moved} and the track was #{@track.length}"
      puts message if car.distance_moved >= @track.length
  end


end


car1 = Car.new("Ford")
car2 = Car.new("Honda")


game = Game.new
game.cars
game.race
