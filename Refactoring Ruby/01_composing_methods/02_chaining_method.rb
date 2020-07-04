require 'pry'
# Chaining methods is easy to read. The secret is to return SELF from the methods you want to allow chaining from.
# Let's say you are building a game and want to add players to it.

class StreetFighter
  attr_accessor :players
  def initialize
    @players = []
  end

  def add_player(player)
    @players << player
  end
end

street_fighter = StreetFighter.new
street_fighter.add_player("Ryu") #['Ryu']
# It worked. However, what was returned when you ran 'add_player'? An Array was returned. Not the streetfighter game object itself.

street_fighter.add_player("Ken") #['Ryu', 'Ken']

#But what if you wanted to chain these like this?
# street_fighter.add_player("Ryu").add_layer("Ken") #NoMethodError: undefined method `add_player' for ["Ryu", "Ken", "Ken"]

# The problem is that add_player method returns the @players ARRAY and not the StreetFighter object itself.
# The solution is to simply return the streetfighter object. Add SELF as the last line in the method. We can then chain and call add_player again.

class StreetFighter
  attr_accessor :players
  def initialize
    @players = []
  end

  def add_player(player)
    @players << player
    self
  end
end



street_fighter = StreetFighter.new
street_fighter.add_player("Ryu") #['Ryu']
street_fighter.add_player("Honda").add_player("Guile") # #<StreetFighter:0x00007fa96f987400 @players=["Ryu", "Honda", "Guile"]>


binding.pry
# Add clocks example from Exercism here as well. It's a good one.