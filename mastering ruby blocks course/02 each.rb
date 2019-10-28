#November 27, 2019 - Each

def space
  puts "\n\n"
end

#times method, upto, step are iterator methods. However Arrays and Hashes in Ruby
#have their own iterator methods.

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


