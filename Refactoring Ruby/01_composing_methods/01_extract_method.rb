require 'pry'
# Methods should strive to do ONE thing. Notice I said strive and not made it into a law that they should do 1 thing.
# Extracting methods makes them shorter and allows for reuse in other methods.
# Extract Method

# Approach #1 - Okay method but we can extract pi out to a method.
def area_circle(radius)
  3.1415926 * (radius**2)
end

# Approach #2 - Better because pi is in a method of it's own. Easily changeble.
def area_circle(radius)
  pi * (radius**2)
end

def pi
  3.1415926
end

# Approach #3 - Extract pi to a constant since it is an unchanging variable.
PI = 3.1415926
def area_circle(radius)
  PI * (radius**2)
end

# Approach #4 - Realize that Ruby and other programming languages already have PI and other math
# constants that you can use. No need to recreate the wheel.

def area_circle(radius)
  Math::PI * (radius**2)
end





# Inline Methods.
# Recall The Matrix. Neo has a choice to be brave and swallow the red pill or take the blue pill to return
# to his normal mundane life.
def swallowed_pill(player)
  if player.brave?
    "Red"
  else
    "Blue"
  end
end

# Approach 1 - replace if with inline method. Easier to read.
# Inline methods are great as a replacement for an if / else statement.
def swallowed_pill(player)
  player.brave? ? "Red": "Blue"
end




# Replace temp with query
# When you're using a temporary variable to hold an expression.

def final_price
  price = @item_price * @quantity
  if price > 2000
    price * .90 # 10% discount
  elsif price > 5000
    price * 0.80 # 20% discount
  else
    price
  end
end

# Approach 1: Move the temporary price variable into it's own method. you might use it in another method.
def final_price
  if price > 2000
    price * 0.90 # 10% discount
  elsif price > 5000
    price * 0.80 # 20% discount
  else
    price
  end
end

def price
  @item_price * @quantity
end