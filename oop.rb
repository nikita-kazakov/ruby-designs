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

