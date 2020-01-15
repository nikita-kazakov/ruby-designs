#January 4, 2019 - Toggle Around

def space
  puts "\n\n"
end

#Below is a phone. When the phone is in airplane mode, you want it to SAVE the message.
#When airplane mode is off, the phone is functional and it should send.
class Phone
  attr_writer :airplane_mode
  def initialize
    @airplane_mode = false
  end

  def text(message)
    if @airplane_mode
      puts "Saved text: #{message}"
    else
      puts "Sent text: #{message}"
    end
  end
end

phone = Phone.new
phone.text("Did you get this?") #Sent text: Did you get this?

#To send text while in airplane mode, you would do:
phone.airplane_mode = true
phone.text("Did you get this?")
phone.airplane_mode = false

#Above is great but it's lengthy. I mean you could also create a method inside the phone class called send in airplane mode.
#This method is great but it's prone to error because you're toggling things and you have to remember to
#toggle things back to their original state.

#Let's write the method that will do that for us.

class Phone
  def in_airplane_mode
    @airplane_mode = true
    yield if block_given?
    @airplane_mode = false
  end
end

#Now, let's run this method outside of the class.
phone.in_airplane_mode do
  phone.text ("in the air now!") #Saved text: in the air now!
end

#So, let's handle exceptions!
# phone.in_airplane_mode do
#   phone.text ("in the air now!") #Saved text: in the air now!
#   raise "Whoops!" #Whoops! (RuntimeError)
# end

#When we 'raise', the code will stop at this line with whatever message you put in there.


#We can rescue exceptions right in our defined method.
class Phone
  def in_airplane_mode
    @airplane_mode = true
    yield if block_given?
    @airplane_mode = false

  rescue Exception => e
    puts e.message
  end

end

phone.in_airplane_mode do
  phone.text ("in the air now!") #Saved text: in the air now!
  raise "Whoops!" #Whoops! (RuntimeError)
end

#Now it prints out whoops.
