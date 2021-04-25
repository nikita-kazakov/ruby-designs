require 'pry'
# If you see an Array or Hash acting as a data structure, you can transform it into an OBJECT.
# Especially great when working with an API.
# This is a typical example of a row you might parse from a CSV file.
# An array is best when it holds a collection of SIMILAR objects. Above are not similar.

# Replace Array with Object

row = ["Bill", 20, "Student"]

# Approach #1 - Not good or understandable.
puts "My name is #{row[0]} and I'm #{row[1]} years old."


# Approach #2 - Make descriptive local variables. Better!
name = row[0]
age = row[1]

puts "My name is #{name} and I'm #{age} years old."

# Approach #3 - Turn Array into an Object.
# Let's turn it into a person object.

class Person
  def initialize(array)
    @array = array
  end

  def name
    @array[0]
  end

  def age
    @array[1]
  end

  def occupation
    @array[2]
  end
end

row = ["Bill", 20, "Student"]
person = Person.new(row)
puts "My name is #{person.name} and I'm #{person.age} years old."
# This is especially great with a long array.









# Lazy initialized attribute
def Person
  def initialize
    @name
    @friends
  end
end


