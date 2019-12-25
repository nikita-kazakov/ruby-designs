#December 28, 2019
#This is yielding practice.

def space
  puts "\n\n"
end

#You already know
3.times do |n|
  puts "#{n}"
end

#Let's write this ourselves.

# run_this_block do
#   puts "this will show up"
# end

def run_this_block
  puts "starting method"
  yield
  puts "ending method"
end

run_this_block do |n|
  puts "this will show up"
end
space
run_this_block do |n|
  puts "The time is now #{Time.now}"
end



#You can check if yield was given. Very useful.

def tell_me
  puts "Started tell_me method"
  yield if block_given?
  puts "Ended tell_me method"
end

tell_me do
  puts "Give me paper!"
end

space



#Let's pass yield parameters
class Array
  def my_map
    new_array = []
    for item in self
      new_array.push (yield item)
    end
    new_array
  end
end

arr = [1,2,3,4]
puts arr.my_map {|num| num * 10}


space

#Let's initialize an object with a default value.
#This works because yield is the very first method that is called when creating an object.
class Car
  attr_accessor :color, :doors
  def initialize
    yield(self)
  end
end

car = Car.new do |c|
  c.color = "Red"
  c.doors = 4
end

puts "This car is #{car.color} and has #{car.doors}"



#Let's apply blocks to real world examples. Wrapping text in HTML.
def wrap_in_h1
  "<h1>" + yield + "</h1>"
end

puts wrap_in_h1{ "This is H1"}
#<h1>This is H1</h1>
