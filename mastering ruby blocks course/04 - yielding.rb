#November 27, 2019 - Yielding

def space
  puts "\n\n"
end

######
# Yielding - Video
######

#Now we've written built in Ruby blocks...Let's build our own.
#This is Powerful and will take your code FAR.

#Let's return to the times method.
3.times do
  puts "This will show up 3 times"
end
space

#Let's create our own block method:
  # run_my_block do
  #   puts "This will show up."
  # end

#However, to run this method, we have to define the method first, right?

def run_my_block
  puts "Starting method..." #<==this gets run
  yield #<== We want to call whatever is going to be in the block!
  puts "Back in method." #<==back to the method again.
end

#So the yield will essentially in our case be "This will show up 3 times."

run_my_block do
  puts "This will show up."
end

#and you get:
  # Starting method...
  # This will show up.
  # Back in method.

#You can run anything in the block, for example:
run_my_block do
  puts "The time is now #{Time.now}"
end
space
  # Starting method...
  # The time is now 2019-11-27 14:23:58 -0700
  # Back in method.


#This is great, but you saw how 3.times called the block 3 times. How do we do that?
#Let's write a new method that rolls a dice.

# roll do
#   number = rand(1..6)
#   puts "You rolled a #{number}"
# end

#for this to work, we need to define a ROLL method.

def roll
  puts "Starting Method..."
  yield
  puts "Back in Method."
end

#AND NOW we can uncomment the roll block and run.
roll do
  number = rand(1..6)
  puts "You rolled a #{number}"
end
  # Starting Method...
  # You rolled a 5
  # Back in Method.

#Go ahead and put two yields if you want to! No problem!
def roll
  puts "Starting Method..."
  yield
  yield
  puts "Back in Method."
end

roll do
  number = rand(1..6)
  puts "You rolled a #{number}"
end
space
  #Starting Method...
  # You rolled a 3
  # You rolled a 3
  # Back in Method.



#Ready for the insight? You can call yield as many times as you want. It doesn't matter.
#In fact, that's exactly what built-in iterator methods do! WHOA!


#Every method accepts a block fyi. You can run a block but if there is no yield it won't show up.
def roll
  puts "Starting Method..." #NO YIELD.
  puts "Back in Method."
end

roll do
  number = rand(1..6)
  puts "You rolled a #{number}"
end
  # Starting Method...
  # Back in Method.

#it ignored the block input!
space



#However, if the method specifically has a yield in it, you MUST use it as a block, otherwise error.
def roll
  puts "Starting Method..." #NO YIELD.
  yield
  puts "Back in Method."
end

# roll    no block given (yield) ERROR.
roll {puts "this will be yield"} #This works fine though.
space


#if block_given?
#BUT!!! You can make your code flexible by checking whether a block is passed or not like this:

def roll
  puts "Starting Method..."
  yield if block_given?
  puts "Back in Method."
end

#Both calls work because we CHECK with if block_given?
roll
roll {puts "YO YO"}
space


#So let's see how we can give yield parameters. This one is a bit tough
# to wrap your head around. stick with it.
def roll
  puts "Starting Method..."
  number = 4
  yield("Larry", number) if block_given?
  yield("Moe", number) if block_given?
  puts "Back in Method."
end

roll do |name, number|
  puts "#{name} rolled a #{number}"
end
  # Starting Method...
  # Larry rolled a 4
  # Moe rolled a 4
  # Back in Method.


