#Let's talk about TIME
#Time is the amount of seconds since Jan 1, 1970 (same as Unix)

p Time.now
p Time.now.to_i #<==1567199327 unix time (since Jan 1, 1970)
p Time.at(1567199327) #<2019-08-30 17:08:47 passing back the unix time.

p Time.new(2019, 8,30) #< 2019-08-30

#Remember that time is in SECONDS from Jan 1, 1970.
#So we can add seconds to time.
p Time.now + (60*60*24) #Time now + 1 day.
p Time.now - (60*60*24) #Time now - 1 day.

#Look at all the things you can call on a time instance.
p time = Time.now
p time.year
time.month
time.day
time.hour
time.min
time.sec
time.nsec
p time.saturday?
p time.yday #<==returns day number out of 365

#The powerful formatting method is strftime


#DATE Class
#It's similar to time class. The Time class already includes the date but you might think it's easier to use date class.
# You need to INCLUDE Date. Ruby doesn't load it automatically.
# Google Ruby Standard Library and you'll see libraries like Date, YAML, CSV, etc...
# You just need to include it, like you do with classes.
require 'date'

p date = Date.today
p date.month



#EXCEPTIONS. Let's learn how to handle ERRORS.
# Things like SyntaxERROR or NoMEthodErrors.
# We Raise an Exception. Our code raises an exception.

#For example, if you run 1 divided by zero, you'll get a ZeroDivisionError
# p 1/0
# You don't want the user to encounter these. You want to handle these gracefully!

#To handle that, you want to use the rescue keyword...with a begin and end surrounding it.

begin
  #code that throws exception
  1/0
rescue
  #code for handling exception
  #maybe you want to log something here.
  puts "Exception raised but handled."
end

#Another example of this

def divide(x,y)
  x/y

rescue
  puts "exception raised"
end
p divide(1,1)
p divide(1,0) #<exception raised.

#How do we handle specific exceptions?
def divide(x,y)
  x/y

  rescue ZeroDivisionError
    puts "Cannot divide by zero"

  rescue TypeError, ArgumentError
    puts "Requires two integer arguments"

  rescue #This is like "else"...if any other exception comes up, we'll let the person know.
    puts "whoops, some exception came up. Be wary."
end

divide(1,0) #<==cannot divide by zero
divide(1, "hi") #<==requires two integer arguments



#Don't ever rescue the Exception class itself.
# rescue Exception <==bad. Wrong.
#Handle exceptions, don't swallow them.
#

#Our code can raise exceptions too. We can plan our classes to check for the correct input

def even_numbers(array)

  raise ArgumentError.new("This isn't an array") unless array.is_a?(Array)

  if array.length == 0
    raise StandardError.new("Too few elements")
  end

end

p even_numbers([2,4,6])
#p even_numbers("5")




