#Dec 28, 2019. This is just practice.

def space
  puts "\n\n"
end

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

#Who are the frequent flyers that have flown at least 3000 miles?
puts flyers.select{|flyer| flyer.miles_flown >=3000}
puts "\n\n"

#How about those tha have flown less thatn 3k miles?
puts flyers.reject{|flyer| flyer.miles_flown >=3000}
puts "\n\n"
#Lets say you personally call all your bronze status to encourage them to move to silver. Who is the first flyer you call?
puts flyers.select{|flyer| flyer.status == :bronze}.first
#or
puts flyers.detect{|flyer| flyer.status == :bronze}



#Ennunmerables
scores = [83, 71, 92, 64, 98, 87, 75, 69]

#return all scores doubled
p scores.map {|score| score *2} #you can also use #collect.
space

#Find if scores add up to 600 using #reduce (same as #inject)
puts scores.reduce{|sum, score| sum + score} #639
#Can also pick a beginning number as a parameter
puts scores.reduce(100){|sum, score| sum + score} #739

#Partition the scores into TWO ARRAYS even and odds.
evens, odds = scores.partition{|score| score.even?}
puts "Evens are #{evens} and Odds are #{odds}"

print scores.select{|score| score.even?}


#Return to flyer status

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

#Divide the flyers into two camps: Platinum flyers and all others. Print both.
#Side note (Yes, you can use partition but when someone else looks at your code, they'll be confused. Keep it simple!)
flyers_platinum = flyers.select{|flyer| flyer.status == :platinum}
flyers_others = flyers.reject{|flyer| flyer.status == :platinum}
puts "Platinum flyers: #{flyers_platinum}"
puts "All other flyers: #{flyers_others}"

space

#Now print out all flyers and their status (prettify)
flyers.each do |flyer|
  puts "#{flyer.name} (#{flyer.status})"
end

space
