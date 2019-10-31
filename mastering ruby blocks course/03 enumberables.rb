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