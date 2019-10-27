#November 26, 2019 - Let's begin course!

def space
  puts "\n\n"
end

#simple multi-line block.
3.times do
  puts "hi"
end
space


#same but with same line.
3.times{ puts "echo" }
space


# you can pass the number that's from times right to the block.
3.times do |number|
  puts "#{number} Echo!"
end
space


#Same thing!
3.times{|n| puts "#{n} Echo!"}
space


#what if we don't want to start counting at zero? No problem.
1.upto(3) {|n| puts "#{n} Echo!"}
space


#Exercise
5.times do
  puts "situp \npushup \nchinup"
end
space


#Same thing but with a repetition number
#times method passes the iteration count via block parameter "n"
5.times do |n|
  puts "#{n}situp"
  puts "#{n}pushup"
  puts "#{n}chinup"
end
space


#Same thing but start from 1 to something.
1.upto(5) do |n|
  puts "#{n}situp"
  puts "#{n}pushup"
  puts "#{n}chinup"
end
space


#Suppose you have a frequent flyers program:
class Flyer
  attr_reader :name, :email, :miles_flown
  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{@name} (#{@email}): #{@miles_flown}"
  end
end


#Let's create 5 unique flyers
1.upto(5) do |n|
  puts Flyer.new("Flyer #{n}", "flyer#{n}@example.com", 1000*n)
end
space


#Random foolishness
1.upto(5) do |n|
  n = rand(n)
  puts Flyer.new("Flyer #{n}", "flyer#{n}@example.com", 1000*n)
end
space

#Let's use the step method to count by 2 instead of by 1.
1.step(9, 2) do |n|
  puts "#{n}situp"
  puts "#{n}pushup"
  puts "#{n}chinup"
end
space

#Blocks GOTCHAS!
#Variables inside blocks are LOCAL. They are only in scope within the block.
#For example this works
3.times do |n|
  name = "dude"
  puts "#{n} - Hi #{name}"
end
space


#However, this won't:
3.times do |n|
  name = "dude"
  puts "#{n} - Hi #{name}"
end
#puts name <==can't call it because name was defined IN THE BLOCK. LOCAL.
space


#However, I now define name outside the block in the main scope and it works.
name = "dude"
3.times do |n|
  puts "#{n} - Hi #{name}"
end
puts name
space


#However, a block can change the name of a local variable. Weird:
name = "dude"
3.times do |n|
  name = "Joe"
  puts "#{n} - Hi #{name}"
end
puts name #<==the result is Joe.
space

#We can protect that variable temp though.
#variables after the semi-colon are reserved variables for the block
#and won't modify the variable outside the block.
name = "dude"
3.times do |n; name| #Now it's protected and only changed in the block.
  name = "Joe"
  puts "#{n} - Hi #{name}"
end
puts name #<==the result is dude.
space



