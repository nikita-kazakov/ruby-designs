require 'pry'
# You can pass in a hash to an object instead of separate parameters.

class Player
  def initialize(name, health)
    @name = name
    @health = health
  end
end

#Above is nice but you have to remember the EXACT order of parameters you pass in.
player1 = Player.new('Ryu', 100)
player1 = Player.new(100, 'Ryu') # ERROR. Wrong order! #<Player:0x00007fc72987b0e8 @health="Ryu", @name=100>

# Approach 1 - Use Ruby Keywords:
class Player
  def initialize(name:, health:)
    @name = name
    @health = health
  end
end

# By adding colons, there's no mistaking when instantiating a new player.
player1 = Player.new(name:'Ryu', health:100)


# Approach 2 - Instantiate with a hash.
class Player
  class Player
    def initialize(hash)
      @name = hash[:name]
      @health = hash[:health]
    end
  end
end

player1 = Player.new({name: "Ryu", health: 100})

