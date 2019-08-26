class Car

  attr_accessor :name, :health, :speed, :ignition, :distance_moved

  def initialize(name = "Default")

    @name = name
    @health = 100
    @speed = 0
    @ignition = false
    @distance_moved = 0

  end

  def move
    @distance_moved = @distance_moved + rand(0..20)
  end

end


if __FILE__  == $0
  #Sample Code for Car Class
  car1 = Car.new("Ford")

  car1.move
  car1.move
  puts car1.distance_moved
  puts car1.name

end