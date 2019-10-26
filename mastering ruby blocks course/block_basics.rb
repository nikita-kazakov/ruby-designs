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
