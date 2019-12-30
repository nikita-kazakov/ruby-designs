#December 29, 2019 - Custom Iterators Practice

def space
  puts "\n\n"
end

#Let's look at at some REAL WORLD examples of where blocks can be used
#so that you get ideas and use them!

#For example...benchmarking. How long will it take to run?
#
start_time = Time.now
sleep(0.5) #This is really where you'll put your actual code that runs.

elapsed_time = Time.now - start_time
puts "It took #{elapsed_time}"

#Can you think of how you can put this into a block that's yielded? Let's try
#on my own!

#I'll have to call a benchmark method of course.

def custom_benchmark
  start_time = Time.now
  yield if block_given?
  elapsed_time = Time.now - start_time
  puts "Custom Benchmark Time in Seconds: #{elapsed_time}"
end

custom_benchmark do
  sleep 0.5 #This is actual code that will get passed in that we want to bench mark.
end
#Custom Benchmark Time in Seconds: 0.501893

#How cool is that!?
#what if you want to give that custom_benchmark a label before you run anything in it?
#Easy. just pass in a parameter to the method!
#
def custom_benchmark(name)
  start_time = Time.now
  yield if block_given?
  elapsed_time = Time.now - start_time
  puts "#{name} Time in Seconds: #{elapsed_time}"
end

custom_benchmark("stacking") do
  sleep 0.5
end
#stacking Time in Seconds: 0.50509

space

#This pattern is commonly known as "execute around". We're executing around
#the block that is passed.





##ANOTHER EXAMPLE##
##WATER SENSOR DATA##

class Sensor
  def temperature
    rand(100..200)
  end

  def level
    rand(1..5)
  end
end

sensor = Sensor.new
puts "checking water temperature"
if sensor.temperature < 150
  puts "OK"
else
  puts "FAILED"
end

puts "Checking Water Level:"
if sensor.level > 3
  puts "OK"
else
  puts "FAILED"
end

#This code above is NOT WRONG. It's okay. It's just a lot. We can simplify it.

def with_checking(description)
  puts "Checking #{description}"
  result = yield
  if result
    puts "OK"
  else
    puts "FAILED"
  end
end

space

#Look how succinct this code is.
#The beauty of this is that the actual checking is obscured in the with_checking.
#There's flexibility. You can simply change the with_checking method and change propagates.
with_checking("temperature"){sensor.temperature < 150}
with_checking("level"){ sensor.level < 5 }

space
space



##### Real Life Example #2 - HTML TAGS! #####
#HAML. You've seen it before. Rails does this too.

def h1
  puts "<h1>" + yield + "</h1>"
end
h1{"Breaking News"}

space

#let's define an h2 method also.
def h2
  puts "<h2>" + yield + "</h2>"
end

h2{"This is H2"}

space

#This is great, but let's increase our flexibility! Let's be able to
#pass in ANY tag we want to convert to html.


def tag(tag)
  print "<#{tag}>"
  print yield
  print "</#{tag}>"
end

tag(:h1){"Breaking News!"}
tag(:h2){"This is H2"}
tag(:p){"This is paragraph"}
# <h1>Breaking News!</h1>
# <h2>This is H2</h2>
# <p>This is paragraph</p>

space

tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end

# <ul>
#   <li>It sparkles!</li>
#   <li>It shines!</li>
#   <li>It mesmerizes!</li>
# </ul>

#Dude, write the link_to helper.