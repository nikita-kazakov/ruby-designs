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

