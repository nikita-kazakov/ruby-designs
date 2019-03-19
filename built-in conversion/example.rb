winners = ["Homestar", "King of Town", "Marzipan", "Strongbad"]

Place = Struct.new(:index, :name, :prize) do

  def to_int
    index
  end

end

first = Place.new(0, "first", "Peasant's Quest Game")
second = Place.new(1, "second", "Limozeen")
third = Place.new(2, "third", "Butter-da")

[first, second, third].each do |place|

  puts "In #{place.name} place, #{winners[place.index]}!"
  puts "You win: #{place.prize}!"
end

puts winners[second]

########
puts "\n\n"


class ArticleTitle
  def initialize(text)
    @text = text end
  end

  def slug
    @text.strip.tr_s("^A-Za-z0-9","-").downcase
  end

  def to_str
    @text
  end

  def to_s
    to_str
  end
# ... more convenience methods... end

def draw_line(start, endpoint)
  start = start.to_coords if start.respond_to?(:to_coords)
  start = start.to_ary # ... end
end

class Point

  attr_reader :x, :y, :name

  def initialize(x, y, name=nil)
    @x, @y, @name = x, y, name
  end

  def to_coords
    [x,y]
  end

end

start = Point.new(23,37)
endpoint = [45,89]

puts draw_line(start,endpoint)

puts "\n\n\n\n\n"
##################
# ##############
#
#
class TrafficLight
# Change to a new state
  def change_to(state)
    @state = state
  end


  def signal
    case @state
    when "stop" then turn_on_lamp(:red)
    when "caution"
      turn_on_lamp(:yellow)
      ring_warning_bell
    when "proceed" then turn_on_lamp(:green)
    end
  end


  def next_state
    case @state
    when "stop" then "proceed"
    when "caution" then "stop"
    when "proceed" then "caution"
    end
  end


  def turn_on_lamp(color)
    puts "Turning on #{color} lamp"
  end


  def ring_warning_bell
    puts "Ring ring ring!"
  end


end

light = TrafficLight.new
light.change_to("Proceed")
puts light.signal

######
# #####
puts"\n\n\n"

class Gear
attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog      = args[:cog]
    @wheel    = args[:wheel]
  end

     end

Gear.new()