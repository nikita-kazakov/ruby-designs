require 'pry'

class Car
  attr_reader :make
  def initialize(args)
    @make = args[:make]
    @wheels = args[:wheels]
  end
end

class Wheel
  def initialize

  end
end

binding.pry
car1 = Car.new(make: 'toyota')
car1 = Car.new(make: 'ford')
car1 = Car.new(make: 'dodge')

class Wheel
  def initialize(args)
    @car = args[:car]
  end

  def ignition

  end
end