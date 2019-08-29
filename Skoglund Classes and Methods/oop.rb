#From Learning Ruby OOP Model in 10 Minutes - Arkency
#https://www.youtube.com/watch?v=gQPArbEmWb8
#
# I suggest you go into IRB mode and type these out if you want to review these.

#Everything is an object. What does that mean?
1.class     # Integer
"".class    # String
"hi".class  # String
[1,2,3].class #Array
{name: "Bob", age: 10}.class #Hash

#Go ahead and ask using a Ruby method as well.
1.is_a?(Integer) #=>True
1.is_a?(Object)  #=>True
1.is_a?(String)  #=>False

#So if you want to create a new object:
duck = Object.new #<Object:0x000056278de56d88>

#You want this object to do something? Define a method for it.
duck.define_singleton_method(:quack) do
  puts "QUACK!"
end
#=> :quack
#Ruby uses synctactic sugar and the 'friendly way' of writing this exact thing is:
def duck.quack
  puts "QUACK!"
end


#When you want to call this method. You will be sending a message "quack" to the duck object.
# This is the what happens under the hood...without Ruby syntactic sugar.
duck.send(:quack) #=> QUACK!
#The same thing with synctatic sugar is:
duck.quack


#We can also see WHICH methods are available for the object
# If we use the false argument, it will only provide the singelton methods that were defined.
duck.methods(false) #=> :quack

#What is a singleton class?
# Whenever you create an object as shown below. ANY object has a singleton class
a = Object.new #=>  #<Object:0x000056278debc750>
a.methods # A hash is returned that contains :singleton_class
a.singleton_class #=> #<Class:#<Object:0x000056278debc750>>



#Start Skoglund Classes and Methods
# Classes create objects with states and behaviors.
# state = attributes (instance variables)
# behavior = methods
#
class Person

end

#An instance is a single object created from a class
bill = Person.new #<==created an instance called bill.
bob = Person.new

#Both bill and bob are different objects!
p bill.object_id #<47227400271520
p bob.object_id  #<47227400271500

#If you want to take this class into it's own file remember to call it:
# relative_require 'person'


#Let's talk attributes. It's properties of an object. The car is green. The name is bob.
#These will be stored as variables. Instance if it's part of class. There are many different variables:
# Global = $variable
# Class = @@variable
# Instance = @variable
# local = variable
# block = variable

#How about reader and writer methods? You can't directy access instance variables!

class Animal
  def initialize

  end

  def noise
    @noise
  end

  def noise=(value)
    @noise = value
  end
end

animal = Animal.new
p animal.noise="Oink" #<==sets "Oink"
p animal.noise  #<= returns "Oink"

#How about attribute methods?
#Attr_reader (Getter), Attr_write(setter), Attr_accessor(Getter and setter)
#

class Animal
  attr_accessor :noise
end

p animal.noise="Oink" #<==sets "Oink"
p animal.noise  #<= returns "Oink"

#Why would you want to make attribute only readable? You want direct control over variables.
#Let's say you're creating a fighting game and you have a new fighter. You want him to start with a health of 100.
#You don't want anyone else setting that health to 1000 or some weird negative number such as -444.

class Fighter
  attr_reader :health

  def initialize
    @health = 100
  end

  def health_increase
    @health = @health + 10
  end

  def health_decrease
    @health = @health - 30
  end

end

ryu = Fighter.new
p ryu.health #<= 100
ryu.health_decrease
p ryu.health #<= 70

#Your methods should be controlling the health, not someone outside of the methods.
#Let's say we want to change the variable in this case:
class Fighter
  attr_accessor :health

  def health_superman
    self.health = 150 #<==This self dot here calls the health METHOD, not the @health instance variables. This is correct
                      #It's not ideal to change instance variables directly. Use a getter / setter method.
  end
end

ryu = Fighter.new
p ryu #<=#<Fighter:0x00005637878b0780 @health=100>
p ryu.health_superman
p ryu #<Fighter:0x000055d859ac4338 @health=150>



#Let's talk about method access control.
#We already know you can't access instance variables from OUTSIDE the class. It's called encapsulation. Think Moat.
#We can do the same for methods. We can restrict access to methods outside.
#There are three method controls:
# Public : normal methods (default)
# private : Can only be called INSIDE the class...not outside.
# protected: Can only be called by instance of class and it's subclasses.

class Fighter

  private
  def scream
    puts "AHHHHHHH"
  end

end

ryu = Fighter.new
#ryu.scream  <== This returns an error. It's a private method.
#

#What does the initialize method do?
# initialize is automatically run when a new instance is created.  It always runs first.
#It's useful if you want to set attributes to a default state or specific state.
#You set it as specific state by providing ARGUMENTS to the new method.


class Fighter
  def initialize()
    @health = 100
    puts "Thank you for creating me!"
  end
end

p Fighter.new #<=#<Fighter:0x0000558368043e68 @health=150>, Thank you for creating me!


#It's common to see the initialize method with a HASH.
# We're passing a hash in a variable called options.
# We're then saying, grab the key for the value called "name".....or if that's not passed, then return default 'Smith'
class Fighter
  def initialize (options ={})
    @name = options[:name] || 'Smith'
  end
end

p Fighter.new #<==#<Fighter:0x00005562f1f27458 @name="Smith">
p Fighter.new(name:"Ryu") #<#<Fighter:0x00005562f1f272c8 @name="Ryu">

#You can also use keyword arguments implemented in Ruby 2.0 and above. Use this instead of above hash passing.
#Make sure you give defaults to each keyword argument you put in below.
class Fighter
  def initialize(name: "Unknown", nationality: "Unknown")
    @name = name
    @nationality = nationality
  end
end

p Fighter.new #< #<Fighter:0x000055b773036b48 @name="Unknown", @nationality="Unknown">
p Fighter.new(name:"Ryu", nationality: "Japanese") #< #<Fighter:0x000055e2837d6b10 @name="Ryu", @nationality="Japanese">

#Advantage here is that you don't need to remember the ORDER of things.


##CHALLENGE: Model a set of Dice
# A DiceSet instance contains 2 DIE
# A method DiceSet.roll should roll die and return random # between 0 and 5
# DiceSet.display should display values of both dice

#Use IRB to play around by providing it a 'require_relative 'oop.rb'
#

class Dice
  attr_reader :die_one, :die_two

  def roll
    #self.die_one = rand(1..6) #<=this won't work because you didn't create an attr_writer method.
    @die_one = rand(1..6)
    @die_two = rand(1..6)
  end

  def display
    puts "Die 1: #{self.die_one}"
    puts "Die 2: #{self.die_two}"
  end

end


dice = Dice.new
dice.roll
dice.display #< Die 1: 1 Die 2: 6


#ON CLASS ATTRIBUTES AND METHODS SECTION.
#Before we talked about Instance methods and instance attributes.
#Here, we'll talk about CLASS METHODS and ATTRIBUTES
# August 30, 2019

#Class Methods relate to the class itself, not a specific instance.
#This means we call them directly on a class, not on an instance.

#Examples:
# Bicycle.all_brands or Animal.new or Invoice.find(2)

#We define these class methods differently with (SELF). Self Refers to the class itself. It's just a stand-in for class name.

class Car
  def self.description
    puts "I'm a car factory."
  end
end

puts Car.description #<= "I'm a car factory"

#You could also write def Car.description (same thing)
class Car
  def Car.description
    puts "I'm a car factory."
  end
end

puts Car.description #<= "I'm a car factory"

#Let's explore more. This below is something we can a factory pattern:
class Product
  attr_accessor :name, :price

  def initialize(price=0)
    @price = price
  end

  def self.exclusive
    Product.new(45)
  end

  def self.standard
    Product.new(30)
  end

  def self.discounted
    Product.new(15)
  end

end

#So now if I call a class method "discounted", it returns a new product with a certain default price.
# We created 2 instances, book1 and book2.
p book1 =  Product.discounted #<=#<Product:0x00005621b04800a8 @price=15>
p book2 = Product.exclusive #<=#<Product:0x00005621b04800a8 @price=45>

#According to the Ruby Documentation:
# class method: Array.new
# instance method: Array#size

class Wrestler
  def initialize(options={})
    @noise = options[:noise] || "Hi"
    @color = options[:color] || "Black"

  end
  def self.types
    %w(rogue sorcerer fighter)
  end

  def self.create_a_fighter
    Wrestler.new(noise: "I'm a new fighter!")
  end

end

p Wrestler.create_a_fighter #< #<Fighter:0x000055cc59f97128 @noise="I'm a new fighter!", @color="Black">
p Wrestler.types #< ["rogue", "sorcerer", "fighter"]