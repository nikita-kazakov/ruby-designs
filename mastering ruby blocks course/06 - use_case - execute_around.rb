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
with_checking("temperature"){sensor.temperature < 150}
with_checking("level"){ sensor.level < 5 }
