require 'pry'
# Explaining Variables

# This can get confusing very fast. Too many equal signs. Simplify.
if image.type == 'jpg' && image.size == 'large'
  # Some operation.
end

# Approach #1: break down into methods and make it readable.
if image_type_jpg? && image_size_large?
  # Some operation.
end

# Will return either true or false.
def image_type_jpg?
  image.type == 'jpg'
end

# Will return either true or false.
def image_size_large?
  image.size == 'large'
end


# Extract surrounding method
# Let's say you have two methods that are nearly identical except for something in the middle.

def connect_to_topaz
  puts "connect to company"
  puts "connect to extension"
  puts "connect to topaz"
  puts "exit service"
end

def connect_to_sapphire
  puts "connect to company"
  puts "connect to extension"
  puts "connect to sapphire"
  puts "exit service"
end

# All the lines in these methods are the same except for connect to sapphire and connect to topaz. Enter the block!

def connection_wrapper
  puts "connect to company"
  puts "connect to extension"
  yield
  puts "exit service"
end

def connect_to_topaz
  connection_wrapper do
    puts "connect to topaz"
  end
end

def connect_to_sapphire
  connection_wrapper do
    puts "connect to sapphire"
  end
end

binding.pry