#String manipulation.
# Why you'd do it? Let's say you are building a search engine app. You get "Milk" but you really want to search "milk".
# Or database validation. You get: JoHn@gMAIL.com, you want to save that as john@gmail.com
#

#Bang - means it will apply the method and save it to the object.
p name = "Glory"
p name.downcase
p name #still "Glory"
p name.downcase!
p name #"glory"

#String Substitution (SUB and GSUB)
# The "sub" method will only substitute the FIRST result in your string
str = "The quick brown fox jumped over the quick dog"
p str.sub("quick", "slow") #"The slow brown fox jumped over the quick dog" (NOTICE 2nd quick stayed!)

#What if you want to substitute ALL "quick" with "slow"? Use global sub (gsub)
str = "The quick brown fox jumped over the quick dog"
p str.gsub("quick", "slow") # "The slow brown fox jumped over the slow dog"


#Strip String Method (great for data cleaning)
str = "     the quick brown fox jumped over the quick dog  "
p str.strip #< Removes extra spaces. "the quick brown fox jumped over the quick dog"

#Split. Splits string into array. Great.
p str.split # ["the", "quick", "brown", "fox", "jumped", "over", "the", "quick", "dog"]
numbs = "1:5:3:9:4:5:6"
p numbs.split(":") #["1", "5", "3", "9", "4", "5", "6"]


#What if you were trying to count all the words? Use split and then count the array!
str = "The quick brown fox jumped over the quick dog"
p str.split.count #< 9. 9 words.
#How many characters are in that string?
p str.split(//).size #<==45. that's including the empty spaces.
#Where is this used? How about twitter character count? yep.


#Let's talk about methods and how they return
def speak
  x = 10
  return "This is groovy" if x == 10
  "booooo"
end

p speak #<== "This is groovy", notice that it skips "booo". It just get out of the method.
#If you don't put a return, then the last line is what's returned.
#


#What's the different between PUTS and Returning Values
def void_method
  puts "Hey There"
end

void_method #<==in IRB it's going to be followed by "NIL". WHy nil?
#Puts doesn't return anything, remember that. It just prints to the console, that's it.
 def method_with_return
   "hey"
 end
method_with_return #<==this returns "hey". Not Nil. In a real world application, you're not going to be using puts.
#Puts is mostly used for debugging / seeing things in console. Unless you're going to be creating apps only in
#console...which you probably won't...don't use puts as it's not a return. It's just a console print out.


#Let's talk about PROCS.
# It's a way to put a method into a variable.
full_name = Proc.new{|first, last| first + " " + last}
#We can call this the normal ruby way.
p full_name["Nikita", "Kaz"] #< "Nikita Kaz"
p full_name.call("Nikita", "Kaz") #< "Nikita Kaz"  This is another way to call...with parenthesis.

#Let's go through a Proc
#full_name = Proc.new #<==It's creating a new proc and setting it as full_name
full_name = Proc.new{|first, last| first + " " + last} #<==It can take a code block as you see here.
#We passed 2 arguments (first and last).

#Here's another syntax for writing it.
full_name = Proc.new do |first, last|
  first + " " + last
end

p full_name.call("nikita","kaz")

#So why use a proc instead of a traditional method? You could have done all this with a regular method:
def full_name(first, last)
  first + " " + last
end

full_name("nikita", "kaz") #<==same but with method instead of a proc.

#With a Proc, it's synctacticly nice because you can store everything inside of the full_name variable.
#This is handy in Rails, when you use a Lambda. Remember using lambda to query the database? Yep.


#Let's discuss Lambdas
#They are similar to procs.
first_name = lambda{|first, last| first + " " + last}
p first_name.call("Nikita", "Kaz") #<==Nikita Kaz

#In real world applications, you won't see the lambda syntax above.
# In rails apps, you'll see this syntax right here when querying databases.
first_name = ->(first, last) {first + " " + last}
p first_name.call("Nikita", "Kaz") #<==Nikita Kaz


#SO what's the difference between procs and lambdas? They are tiny differences.
#Argument Count. Lambda's count arguments passed to them but procs do not.
full_name = lambda {|first, last| first + " " + last }
p full_name.call("Nikita", "Kaz") #<==Nikita Kaz. correct.
#p full_name.call("Nikita", "Kaz", "boo") #<==wrong number of arguments (given 3, expected 2)


#If this was a Proc and you'd call the third argument, it would completely ignore the third argument and run.


#Also the return behavoir is different.
def my_method
  x = lambda {return}
  x.call
  p "Text from within the method"
end

my_method #<==Text from within the method.

def my_method
  x = Proc.new {return}
  x.call
  p "Text from within the method"
end
my_method #<==Returns NIL. When it sees return in Proc, it just quits the method all-together.


#Let's talk about method arguments. That's the data you provide to the method.
def full_name(first, last)
  first + " " + last
end

p full_name("Nikita", "Kaz") #<Nikita Kaz


#This way of doing method arguments is new in Ruby 2 and above. Keyword arguments.
def print_address (city:, state:, zip:)
  puts city
  puts state
  puts zip
end

print_address(city: "Brooklyn", state:"Az", zip:"80134") #<==brooklyn, Az, 81034

#Why is this an advantage? You don't care about positioning of these arguments anymore. switch them up, it's all good.
#This is how you write these DSL Methods. Oh shit...yes!
print_address(
    city: "Brooklyn",
    state: "New York",
    zip: 11214
)

#This is critical when you're building API's. They are descriptive and concise. No confusion.
#The second reason you want to use this is because you can pass in DEFAULT arguments.

def stream_movie(title:, lang:)
  puts title
  puts lang
end

p stream_movie(title: "go", lang: "english") #<great, it works.
#p stream_movie(title: "go")  <==whoops error.
# You want a default value for language.

def stream_movie(title:, lang:"ENG")
  puts title
  puts lang
end

p stream_movie(title: "go") #<==go, ENG.
p stream_movie(title: "go", lang:"RUS") #<==go, RUS. It will overwrite the default argument.

#Remember, the old school way of doing that is with option hashes.



#Let's create a roster method.
# This method below is great...but what if you had 40 players...dude. that's a lot.
def roster (player1, player2, player3)
  puts player1
  puts player2
  puts player3
end

roster("tito", "bito", "lulo")

#Instead, we can use what's called a SPLAT argument. It treats the argument as an array.
def roster (*players)
  p players
end

roster("tito", "bito", "lulo") #<==tito, bito, lulo
roster("tito", "bito", "lulo", "guido") #<==tito, bito, lulo, guido

#You can also use a KEYWORD based splat (double splat). This takes HASHES.
def which_players(**players_with_positions)
  players_with_positions.each do |key, value|
    p "Player: #{key}, with value: #{value}"
  end
end

hash = {
    "Jim": "baseball",
    "Bob": "soccer"
}
which_players(hash) #<"Player: Jim, with value: baseball" "Player: Bob, with value: soccer"

