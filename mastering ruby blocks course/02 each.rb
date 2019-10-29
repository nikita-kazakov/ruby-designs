#November 27, 2019 - Each

def space
  puts "\n\n"
end

#times method, upto, step are iterator methods. However Arrays and Hashes in Ruby
#have their own iterator methods.
#Each is an iterator. It's just used with Arrays and Hashes often.

weekdays = %w(monday tuesday wednesday thursday friday)
#In other languages, you'd use for loops to iterate through each. Not in Ruby.

weekdays.each {|day| puts day}
space

#Let's look at our order example.
class Order
  attr_reader :email, :total
  def initialize (email, total)
    @email = email
    @total = total
  end

  def to_s
    "#{email}: $#{total}"
  end
end

#We put the orders into an array:
orders = []
1.upto(5) do |n|
  orders << Order.new("customer#{n}@example.com", n*10)
end
p orders #<==remember, these are ORDER OBJECTS!
space

#So let's print out the email associated with the order.
puts "Newsletter emails:"
orders.each do |order|
  puts order.email #<==these are objects so you can call #email method.
end
space


#Let's sum up totals from all the orders.
sum = 0
orders.each {|order| sum += order.total}
puts "The sum is : #{sum}"
space


#What about hashes? It has an EACH method too!

taxes = {"CO": 0.02,
         "MT": 0.00,
         "AZ": 0.04
}

#Let's print out each state and it's tax as a percentage:
taxes.each do |key, value|
  percent = value * 100
  puts "#{key} has a tax of #{percent}%"
end
space

#But dude, make better names...not key, value.
taxes.each do |state, tax|
  percent = tax * 100
  puts "#{state} has a tax of #{percent}%"
end
space



#######################
#Exercise time!
#######################

cards =  %w(Jack Queen King Ace Joker)

#Let's print them with UPCASE
cards.each {|card| puts card.upcase}
space

#Show number of characters for each card too.
#Instead of card.chars.count you can use card.length too.
cards.each {|card| puts "#{card.upcase} - #{card.chars.count}"}
space

#Let's shuffle and display!
cards.shuffle.each {|card| puts "#{card.upcase} - #{card.chars.count}"}
space

#Let's say you want to iterate in reverse order. Two ways of doing it
#Way #1
cards.reverse.each {|card| puts "#{card.upcase} - #{card.chars.count}"}
space

#Way #2 = There's a reverse_each iterator.
cards.reverse_each {|card| puts "#{card.upcase} - #{card.chars.count}"}
space

scores = {"Larry" => 10,
          "Moe" => 8,
          "Curly" => 12
}


#Print players name and score
scores.each do |key, value|
  puts "#{key} scored a #{value}!"
end
space


#Let's go back to our frequent flyers program class
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

#Generate 5 flyers and put them in an array:
flyers = []
1.upto(5) do |n|
  flyers << Flyer.new("Flyer#{n}", "Flyer#{n}@example.com", 1000* n)
end

#Iterate through all flyers and print out their names and miles flown
flyers.each do |flyer|
  puts "#{flyer.name} - #{flyer.miles_flown} miles"
end
space

#Tally up all the miles flown
sum = 0
flyers.each do |flyer|
  sum += flyer.miles_flown
end
puts "Total miles flown: #{sum}"
space

#Airlines will give you a multiplier for each mile you fly.
promotions = { "United" => 1.5,
               "Delta" => 2.0,
               "Lufthansa" => 2.5 }

#Iterate through hash and print each airlines promotion:
promotions.each do |key, value|
  puts "Earn #{value}x miles by flying #{key}!"
end
space

#########
#Bonus Round! Non-obvious iterators.
#########

#A file is a collection of lines, right?
file = File.open("poem.txt") #star spangled banner is in the poem.txt
file.each do |line|
  puts line
end
space

#Similarly, a directory is a collection of files and other directories.
dir = Dir.open("/Users")
dir.each do |entry|
  puts entry
end

#Challenge! Let's put an interator inside an iterator. We want to print:
  # Flyer 1 could earn 1500.0 miles by flying United!
  # Flyer 1 could earn 2000.0 miles by flying Delta!
  # Flyer 1 could earn 2500.0 miles by flying Lufthansa!
  # Flyer 2 could earn 3000.0 miles by flying United!
  # Flyer 2 could earn 4000.0 miles by flying Delta!
  # Flyer 2 could earn 5000.0 miles by flying Lufthansa!

flyers.each do |flyer|
  promotions.each do |airline, multiplier|
    puts "#{flyer.name} could earn #{flyer.miles_flown * multiplier} by flying #{airline}!"
  end
end