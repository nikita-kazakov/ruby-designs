#Everything is an object in Ruby even to the point that nothing (nil) is an object also!

#One way you'll see nil is by returning a values for a hash when the key isn't found.
h = {}
h[:ring] #<=nil

#empty methods return nil by default
def empty
end
p empty #<= nil

#If an if statement evaluates to false and it's without an ELSE, it will return nil.
result = if 5 == 3
          "5 is 3"
         end
p result #nil


#Same with a case statement that has no matches but it without else.
#Lesson: Else is critical in IF and CASE statement.

#Unset instance variable always return nil. This is dangerous if typos.
p @blah #nil

#These are just some examples of where nils show up. There are countless more!


#Let's look at this example for fetching a password:
# specifically, it returns a nil. why?
require 'yaml'
SECRETS = File.exist?('secrets.yml') && YAML.load_file('secrets.yml')

def get_password_for_user(username=ENV['USER'])
  secrets = SECRETS || @secrets
  entry = secrets && secrets.detect{|entry| entry['user'] == username}
  entry && entry['password']
end

get_password_for_user        # => nil

#There could be many reasons for it returning a nil
#   -@secrets is nil
#   -User ENV variable wasn't set
#   -secrets.yml exists but it's empty
#The issue is that it's hard to pinpoint why nil happened. That's the problem.

#There is no one solution to dealing with them. But be aware of them and do whatever
#you can do avoid them.


