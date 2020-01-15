#January 4, 2019 - Toggle Around Practice

def space
  puts "\n\n"
end

#Suppose you're designing an app that can be run in three different environments: dev, test, and production (Rails anyone?)
#The default runs in dev.

class Application
  attr_accessor :environment

  def initialize
    @environment = :development
  end

  def connect_to_database
    puts "Connecting to #{@environment} database..."
  end

  def handle_request
    puts "Handling #{@environment} request..."
  end

  def write_to_log
    puts "Writing to #{@environment} log file..."
  end
end

app = Application.new
app.connect_to_database
app.handle_request
app.write_to_log


space
#Let's say you want to use the same methods but call them in the production environment.
#One way to do it is like this but it's lengthy:
app.environment = :production
app.connect_to_database
app.handle_request
app.write_to_log
app.environment = :development

#Let's simplify this by adding a method called in_production.
class Application
  def in_production
    @environment = :production
    yield if block_given?
    @environment = :development
  end
end

space

app.in_production do
  app.connect_to_database
  app.handle_request
end

space
#Let's make it even more expressive by allowing ourselves to call:
# app.in_environment(:production) do...

class Application
  def in_environment(env)
    @environment = env
    yield if block_given?
    @environment = :development
  end
end

app.in_environment(:production) do
  app.connect_to_database
end