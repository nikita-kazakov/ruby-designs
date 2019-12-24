require_relative 'db'


class Driver
  attr_reader :name
  def initialize(name:)
    @name = name
  end
end

module DB
  def self.drivers
    [
      Driver.new(name:"Peter"),
      Driver.new(name:"Sandy"),
      Driver.new(name:"Bob"),
      Driver.new(name:"Alice"),
      Driver.new(name:"Nikki")
    ]
  end

end


class Car
  CARS = ['Honda', 'Toyota', 'BMW', 'Ford', 'GMC']
  attr_accessor :name, :health, :speed, :ignition, :distance_moved
  def initialize
    @driver = select_driver
    @health = 100
    @speed = 0
    @ignition = false
    @distance_moved = 0
  end

  def select_driver
    return driver = DB.drivers.sample
    DB::
    # DB.drivers.pop(driver)
  end

  def move
    @distance_moved = @distance_moved + rand(0..20)
  end

end

car1 = Car.new
p car1


if __FILE__  == $0
  #Sample Code for Car Class
  car1 = Car.new

  car1.move
  car1.move
  puts car1.distance_moved
  puts car1.name
end