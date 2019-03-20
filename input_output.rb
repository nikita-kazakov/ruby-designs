#Working through the Ruby Steps book.
#Input / Output

puts "Hello World" # Which has Ruby Syntactic Sugar because
puts("Hello World") # is the same thing.  You're calling a string method to puts.

#Actually tried to call a to_s method on any object passed to it.
#This is why you can make a to_s method in a class and puts a class.

p puts #is nil.
puts rand(0..5).class #Integer Class.

#you can pass multiple arguments to puts
value = 1
text = "Hi"

puts value, text #It outputs 1 and Hi on different lines.
puts(value, text) #Remember, this is the same thing...


#To do input, use the gets method

#puts "What's your age? (Waiting for answer)"
#age = gets
#puts "Your age is " + age

#Don't forget you can use gets.chomp (relevant in Ruby 2.x?) and also print instead of puts.

#Let's print stuff to a file.
#$stdout.reopen 'fileoutput.log' do
#  puts "This will be saved in fileoutput.log"
#  puts "This too."
#  puts "And this..."
#end

#Object Oriented Messaging
#You're essentially sending messages in object oriented programming
#Every message you send has a receiver.  If you don't specify a receiver, the message is sent to SELF.

#Let's take a look at how SELF works.

class Person

  def speak
    "I'm speaking"
  end

end

personobject = Person.new
personobject.speak #It runs...

class Person

  def speak
    "I'm speaking"
  end

  def do_speak
    puts speak
    puts self.speak #this is the same as above! SELF calls the Person object.
    puts self.speak() #same
    puts speak() #same
  end

  def another_one
    speak = "hi" #Don't be fooled! This "speak" is a local variable, not a method!
  end

end


personobject.do_speak
puts "\n\n\n"


#Passing Arguments to Objects
p [1,2,3,4,5].include?(5) # false
p Array.new(4, "Dude") # ["Dude", "Dude", "Dude", "Dude"]
p (3 + 2) #5

#Realize that operators are simply object LITERALS

puts 10 + 5  # 15. That plus is literal.
puts 10.+(5) # 15. That plus is really a method that's taking an integer as a parameter.

#Don't be afraid.  You can create your own Add10 Method.
class Add10
  def +(number)
    10 + number
  end
end

add10 = Add10.new
puts add10.+(5)

#Let's write a message that accepts a string, waits, and outputs a lowercase of it.
#Let's make an outline of how we want to structure it first:
#We're not worried about where messages will be stored right now... Keep it simple.
#Step 1 -->
def slowercase(a_string)
  #TODO: sleep for 3 seconds
  #TODO: return a lowercase version of the string
  a_string
end

puts slowercase("CoOlStUFf")

#Step 2 --> Make it sleep for 2 seconds.
def slowercase(a_string)
  sleep 2
  #TODO: return a lowercase version of the string
  a_string
end

#Step 3 --> Apply lowercase method.
def slowercase(a_string)
  #sleep 2
  a_string.downcase
end

puts slowercase("CoOlStUFf")

puts "\n\n\n"

#Polymorphism allows us to send messages with minimal coupling.  This is called Duck Typing in dynamic languages.
#You have the ability for multiple objects to respond to ONE message in DIFFERENT WAYS.
#Let's look an an example of POLYMORPHISM.

def print_a_line(printer, string)
  printer.print_line string
end

class PrintPrinter
  def print_line(string)
    print(string + "\n")
  end
end

class PutsPrinter
  def print_line(string)
    puts string
  end
end

print_a_line(PrintPrinter.new, "Hi There")
print_a_line(PutsPrinter.new, "Hi There")

#So you're passing OBJECTS to the print_a_line definition.
#Then calling a print_line method...both those objects have the PRINT LINE method available.

#Let's revisit and make Slowercase Polymorphic.
#Here's the original code:
def slowercase(a_string)
  sleep 0.5
  a_string.downcase
end

#Remember, a method should have 1 responsibility.  This method has 2.  Sleep and downcase.
#Let's create a class for it.

class Slowercase

  def initialize(slower, caser)
    @slower = slower
    @caser = caser
  end

  def slowercase(a_string)
    @slower.slow
    @caser.lowercase a_string
  end

end

class Slower
  def slow
    sleep 1
  end
end

class Lowercaser
  def lowercase(a_string)
    a_string.downcase
  end
end

puts Slowercase.new(Slower.new, Lowercaser.new).slowercase("FuNkYCASe")

#That's a lot to take in.



#Skip to the East Method for OO.
require 'set'

class RubySteps

  def initialize(emailer)
    @emailer = emailer
    @users = Set.new
  end

  def add_user(user)
    @users.add(user)
    user.deliver_welcome_email(@emailer)
    @users.each {|u| u.member_registered(user, @emailer) }
    true
  end

end

class User
  attr_reader :name

  def initialize(name, email)
    @name = name
    @email = email
    @friends = Set.new
  end

  def deliver_welcome_email(emailer)
    emailer.deliver_email(
        subject: "Welcome to RubySteps, #{@name}!",
        to_email: @email,
        to_name: @name,
        body: "This is gonna be so much fun"
    )
    true
  end

end





#Duck Typing
class Xmlparser

  def parse
    puts "an instance of xml parser class received the parse message."
  end

end

class Jsonparser

  def parse
    puts "an instance of Json parser class received the parse message."
  end

end

class GenericParser

  def parse(parser)
    parser.parse
  end

end

genparse = GenericParser.new
genparse.parse(Xmlparser.new) #An instance of xml parser class received the parse message.
genparse.parse(Jsonparser.new) #An instance of JSON parser class received the parse message.

puts "\n\n\n\n"

#Decorator Pattern
class Parser

  def parse
    puts "The Parser class received the parse method"
  end

end

class Xmlparser
  def initialize(parser) #simply adding a parameter to class.
    @parser = parser
  end

  def parse
    puts "an instance of Xmlparser class received the parse message."
    @parser.parse
  end
end

class Jsonparser

  def initialize(parser) #simply adding a parameter to class.
    @parser = parser
  end

  def parse
    puts "an instance of Json parser class received the parse message."
    @parser.parse
  end

end

#Let's test out Decorator pattern:
puts 'Using the XML parser'
parser = Parser.new
Xmlparser.new(parser)