#January 4, 2019 - Block Initializer

def space
  puts "\n\n"
end

#You're developing a graphics library and started to design a Canvas class used to draw graphics (Gosu Gem!)

class Canvas
  attr_accessor :width, :height, :color

  def initialize
    @width = 100
    @height = 100
    @color = :black
  end

  def draw_rect(x,y,width,height)

  end

  def to_s
    "#{@width}x#{@height} #{@color} canvas"
  end
end

#Notice that a Canvas gets created with default values. What if we want custom default values? No problem.
#The traditional way to do this is:

canvas = Canvas.new
canvas.width = 250
canvas.height = 500
canvas.color = :blue
puts canvas

#Or you can use a block to initialize it.

class Canvas
  def initialize
    @width = 100
    @height = 100
    @color = :black
    yield(self) if block_given?
  end
end

canvas = Canvas.new do |c|
  c.width = 10
  c.height = 20
end

p canvas #<Canvas:0x007fcefd1b8c20 @width=10, @height=20, @color=:black>

#This style is used VERY OFTEN IN RUBY. For example, in active record:

class User
  attr_accessor :name, :email, :occupation
  def initialize
    @name = nil
    @email = nil
    @occupation = nil
    yield(self) if block_given?
  end
end

user = User.new do |u|
  u.name = "Larry"
  u.email = "larry@example.com"
  u.occupation = "Comedian"
end

p user