#This is confusing.


#Methods are not first-class objects in Ruby. By defining methods doesn't immediately give you values to pass around.

my_method =
    def hello
      puts "Hello, World"
    end

my_method #nil (doesn't return anything)

#We can ask for an object representing a method though.
class Greeter
  def hello; puts "Hello World"; end
end
greeter = Greeter.new
m = greeter.method(:hello)
m.call #Hello world.

#Classes are first class objects while methods are not. This was done by DESIGN to mimick SMALLTALK.
#Let's say we are writing a tea timer application
#timer is a collaborator that handles counting down, and ui handles uer interaction (notifying when tea ready).

class TeaClock
  attr_accessor :timer, :ui
end

#The time roles has the responsibility of waiting until tea is ready and making an alert.
#time role however doesnt care how the alert is conveyed to user. That's UI job.
#To decouple that, let's inject a NOTIFIER object into timer, which it will "call" when ready.

SleepTimer = Struct.new(:minutes, :notifier) do
  def start
    sleep(minutes * 60)
    notifier.call("Tea is ready!")
  end
end

#That took care of the timer role. Let's make a UI Role.
#Let's simply use standardOUT to communicate.
class StdioUi
  def notify(text)
    puts text
  end
end







#Now, let's put it all together. With creating a tea clock.
class TeaClock
  attr_accessor :timer
  attr_accessor :ui

  def initialize(minutes)
    self.ui = StdioUi.new
    self.timer = SleepTimer.new(minutes, ui.method(:notify))
    init_plugins #<==making it extensible
  end
end

#To initialize plugins:
class TeaClock
  attr_accessor :timer
  attr_accessor :ui

  def initialize(minutes)
    self.ui = StdioUi.new
    self.timer = SleepTimer.new(minutes, ui.method(:notify))
    init_plugins #<==making it extensible
  end

  def init_plugins
    @plugins = []
    ::Plugins.constants.each do |name|
      @plugins << ::Plugins.const_get(name).new(self)
    end
  end

end

##SUPER CONFUSING....