#January 4, 2019 - Block Initializer

def space
  puts "\n\n"
end

#This is a powerful block pattern! It's DSL so to speak in Ruby.
#If you recall building ruby gems, you've seen something like this
#You're assigning values to the attributes inside the object!

spec = Gem::Specification.new do |s|
  s.name = 'my-gem'
  s.version = '2.0.0'
end

puts spec #<Gem::Specification name=my-gem version=2.0.0>


#Let's write our own shorter version of this!
#Let's change the word 'Gem' to 'Jem' so we can rebuild this ourselves.

module Jem
  class Specification
    attr_accessor :name, :version, :summary
    def initialize
      @version = '1.0.0'
    end
  end
end

#Let's just run a new Jem::Specification object. It is build with a default @version = 1.0.0
jem = Jem::Specification.new
puts jem #<Jem::Specification:0x007fc146015f68>

#Let's create a block and pass a YIELD.
module Jem
  class Specification
    attr_accessor :name, :version, :summary
    def initialize
      @version = '1.0.0'
      @name = "default"
      yield(self) if block_given? #<==you need self so it knows what object to yield.
    end
  end
end

spec = Jem::Specification.new do |object|
  object.version = 1.5
end

p spec #<Jem::Specification:0x007ffce09c49f8 @version=1.5, @name="default">
#It worked!
space

#If you don't pass a block, it will just use default values.
#Using a block is a stylistic option. You don't need to absolutely do it.
#You can do:
spec2 = Jem::Specification.new
spec2.name = "Nikita"
spec2.version = "1.8.0"
p spec2 #<Jem::Specification:0x007ffc2985bdf8 @version="1.8.0", @name="Nikita">
#It did the same thing as a block but just a bit verbose.