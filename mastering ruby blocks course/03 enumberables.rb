#November 27, 2019 - Enumerables

def space
  puts "\n\n"
end

#Let's extend our order class a little bit for this chapter.
#We added the tax table and the tax method and added state and status.
class Order

  TAX_TABLE = {"CO": 0.02, "MT": 0.00, "AZ": 0.04}

  attr_reader :email, :total, :state, :status
  def initialize (email, state, total, status=:pending)
    @email = email
    @state = state
    @total = total
    @status = status
  end

  def tax
    total * TAX_TABLE[state]
  end

  def to_s
    "#{email}: $#{total}: $#{total} - #{status}"
  end
end

#Load orders array with Order Objects.
orders = []
orders << Order.new("customer1@example.com", "MT", 300)
orders << Order.new("customer2@example.com", "AZ", 400, :completed)
orders << Order.new("customer3@example.com", "CO", 200)
orders << Order.new("customer4@example.com", "CO", 100, :completed)
puts orders
space

#We want to select all orders greater than...use SELECT method.
#When you say o.total > 300, it returns a true or false. If false, it doesn't select, if true
#it selects and outputs it as an array.

#So now, this return array will have 1 Flyer object returned. This is like activerecord WHERE clause.
puts "Big Orders:"
big_orders = orders.select{|o| o.total >= 300}
puts big_orders
space

#You can do the same thing but with a DO and END.
puts "Big Orders:"
big_orders = orders.select do |o|
  o.total >= 300
end
puts big_orders
space

#FYI, if you're teaching this, it's definitely good to have an array of OBJECTS rather than
#numbers. It's clear this way that the OBJECTS are returned

#So, what about small orders? You CAN use select but select < 300 for example. FLEXIBLE.
puts "Small Orders using #select"
small_orders = orders.select{|order| order.total < 300}
puts small_orders
space

#But you can also use REJECT method.
puts "Small Orders using #reject"
small_orders = orders.reject{|order| order.total >= 300}
puts small_orders
space

#You have all the flexibility! Reject is simply the opposite of select.

#Any orders pending? Using any?
puts orders.any? { |order| order.status == :pending}
space
#true


#So what's the first order that's pending?
puts orders.detect {|order| order.status == :pending}
space

#OR, if you forget #pending, you can do:
puts orders.select{|order| order.status == :pending} #It returns two. I want only the first.
space
puts orders.select{|order| order.status == :pending}.first
space

#Here's a fun fact. The #select, #any?, #reject, #detect methods are NOT defined in the Array class.
#They are defined in the module called Enumberable and SHARED (include) in Arrays and Hashes.



#########
# Exercises: Part I
#########


scores = [83, 71, 92, 64, 98, 87, 75, 69]

#Select scores greater than 80.
high_scores = scores.select{|score| score > 80}
p high_scores
space

#Reject scores higher than 80.
p scores.reject{|score| score > 80}
space

#Any scores less than 70?
p scores.any?{|score| score < 70}

phrases = %w(hat bat dead fred super duper bandicoot goldeneye)

#return 4 letter phrases
p phrases.select{|phrase| phrase.length == 4}

#bigger than 6 letters
p phrases.select{|phrase| phrase.length > 6}
space

#Let's return back to the Frequent Fliers program.

class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

puts flyers
space

#Who are the frequent fliers? (more than 3k miles)
puts flyers.select{|flyer| flyer.miles_flown >= 3000}
space


#Who are the ones that flew below 3k miles?
puts flyers.select{|flyer| flyer.miles_flown < 3000}
space
#or
puts flyers.reject{|flyer| flyer.miles_flown >= 3000}
space


#Have any reached platinum status?
p flyers.any?{|flyer| flyer.status == :platinum}


#######
# Enumerables - Part 2 VIDEO
#######

#What if we to divide orders into two bins? We could use select and reject and then put them in
#two variables. However, there is shortcut with Ennumerables.

puts orders
  # customer1@example.com: $300: $300 - pending
  # customer2@example.com: $400: $400 - completed
  # customer3@example.com: $200: $200 - pending
  # customer4@example.com: $100: $100 - completed

#We can partition.
p orders.partition{|order| order.status == :pending}
#Notice that you get back an array with two arrays in it! One inner array has orders
#with pending, and the other without.
space

pending_orders, completed_orders = orders.partition{|order| order.status == :pending}
puts pending_orders
puts completed_orders
space
#nice. done all in 1 using partition.

#Let's do big orders and small orders
big_orders, small_orders = orders.partition{|order| order.total >= 300}
puts "Big Orders:"
puts big_orders
puts "Small orders:"
puts small_orders
space

#So let's grab all the emails from the orders. We need those emails to send out to clients.
#Here's the way we know how to do it by going through each order and putting emails in an array.
emails = []
puts "Newsletter emails:"
orders.each{|order| emails << order.email.downcase}
p emails

#However, there's another quick way to do this WITHOUT creating an extra "emails" array.
#We use #map. It simply takes the true results wraps an array around them!
#The method #collect is the same as #map.
emails = orders.map{|order| order.email.downcase}
p emails

#The finance department wants to know the taxes of orders in CO.
puts "Taxes: "
co_orders = orders.select{|order| order.state == "CO"}
space

#Let's look at how we can sum things up in ruby with #reduce
numbers = [1,2,3,4]

p numbers.reduce {|sum, number| sum + number}
space

#There is also a shortcut with #reduce.
p numbers.reduce(:+)

#Or multiply
p numbers.reduce(:*)

#But what if you have OBJECTS. More complicated.
# You need to pass in 0 as the inital object so it knows what to start with.
orders.reduce(0){|sum, order| sum + order.total}



#######
# Enumerables - Part II Exercise
#######

scores = [83, 71, 92, 64, 98, 87, 75, 69]

#double all the points in array.
p scores.map{|score| score * 2}

#If the total of all scores is more than 600, kids get ice cream. Is total over 600?
p scores.reduce(0){|sum, score| sum + score}
space


#Partition scores in evens and odds.
even_scores, odd_scores = scores.partition{|score| score.even?}
p even_scores
p odd_scores
space


#Let's return back to frequent flyers

#divide flyers into two groups: platinum and all others.
platinum_flyers, other_flyers = flyers.partition{|flyer| flyer.status == :platinum}
puts "Platinum Flyers:"
puts platinum_flyers
puts "Other Flyers:"
puts other_flyers
space


#You need to print friendly name tags and status upcased. Map it:
puts flyers.map {|flyer| "#{flyer.name} (#{flyer.status.upcase})"}
space

#You need to get distance by each flier and convert to km.
p flyers.map{|flyer| flyer.miles_flown * 1.6}

#How many total miles have your passengers flown? Sum it up!
puts flyers.reduce(0){|sum, flyer| sum + flyer.miles_flown}