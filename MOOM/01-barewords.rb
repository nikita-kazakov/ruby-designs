salutation  = "Most agreeable to see you"
title       = "Commander"
full_name   = "Sam Vimes"
progname    = "Dis-organizer"
version     = "Mark 7"
designation = "Seeree"
service_inquiry = "order you a coffee"

puts "#{salutation}, #{title} #{full_name}. ",
     "Welcome to #{progname} version #{version}. ",
     "My name is #{designation}.",
     "May I #{service_inquiry}?"
# >> Most agreeable to see you, Commander Sam Vimes.
# >> Welcome to Dis-organizer version Mark 7.
# >> My name is Seeree.
# >> May I order you a coffee?



#Let's make this better by pulling this into a a #greet method within a class.

class ObsequiousImp

  def greet(title, full_name)
    salutation  = "Most agreeable to see you"
    progname    = "Dis-organizer"
    version     = "Mark 7"
    designation = "Seeree"
    service_inquiry = "order you a coffee"

    puts "#{salutation}, #{title} #{full_name}. ",
         "Welcome to #{progname} version #{version}. ",
         "My name is #{designation}.",
         "May I #{service_inquiry}?"
  end
end

ObsequiousImp.new.greet("Cpt", "Nikita")



#However there will be different kinds of Imps. Different Imp will greet differently.

class ObsequiousImp

  def greet(title, full_name)
    progname    = "Dis-organizer"
    version     = "Mark 7"
    designation = "Seeree"
    service_inquiry = "order you a coffee"

    puts "Most agreeable to see you, #{title} #{full_name}. ",
         "Welcome to #{progname} version #{version}. ",
         "My name is #{designation}.",
         "May I #{service_inquiry}?"
  end
end

#Now you're told that the name will come as first_name, last_name, not full_name. Let's make changes.
class ObsequiousImp

  def greet(title, first_name, last_name)
    progname    = "Dis-organizer"
    version     = "Mark 7"
    designation = "Seeree"
    service_inquiry = "order you a coffee"

    puts "Most agreeable to see you, #{title} #{first_name} #{last_name}. ",
         "Welcome to #{progname} version #{version}. ",
         "My name is #{designation}.",
         "May I #{service_inquiry}?"
  end
end

ObsequiousImp.new.greet("Cpt", "Nikita", "Kaz")




#To clean things up, let's represent the version as a constant, however it has nothing to do with this class.
#Let's represent it in a module.

module DisOrganizer
  VERSION = "Mark 7"
end

class ObsequiousImp
  def greet(title, first_name, last_name)
    progname    = "Dis-organizer"
    designation = "Seeree"
    service_inquiry = "order you a coffee"

    puts "Most agreeable to see you, #{title} #{first_name} #{last_name}. ",
         "Welcome to #{progname} version #{DisOrganizer::VERSION}. ",
         "My name is #{designation}.",
         "May I #{service_inquiry}?"
  end
end

ObsequiousImp.new.greet("Cpt", "Nikita", "Kaz")

#Each user can name their own imp. So let's create the designation an instance variable.



class ObsequiousImp
  def initialize(designation)
    @designation = designation
  end

  def greet(title, first_name, last_name)
    progname    = "Dis-organizer"
    service_inquiry = "order you a coffee"

    puts "Most agreeable to see you, #{title} #{first_name} #{last_name}. ",
         "Welcome to #{progname} version #{DisOrganizer::VERSION}. ",
         "My name is #{@designation}.",
         "May I #{service_inquiry}?"
  end
end

ObsequiousImp.new("Alpha").greet("Cpt", "Nikita", "Kaz")

#At each step we slowly abstracted thing. It's messy. Specifically this:
  # The title remained a method argument.
  # The full name was broken out into two arguments.
  # The imp’s designation became a property of a single instance.
  # The special feature became a member of a composited object.
# It would be easy to introduce a defect to code like this.







#Let's see if we could do it a different way so we have LESS impact on code.
# We'll learn about the concept of BAREWORDS.
#Let's make the salutation a METHOD. Notice that the greeting code remains unchanged.
class ObsequiousImpTwo
  def salutation; "Most agreeable to see you"; end
  def greet(title, full_name)
    progname    = "Dis-organizer"
    version     = "Mark 7"
    designation = "Seeree"
    service_inquiry = "order you a coffee"

    puts "\n\n\n"
    puts "#{salutation}, #{title} #{full_name}. ",
         "Welcome to #{progname} version #{version}. ",
         "My name is #{designation}.",
         "May I #{service_inquiry}?"
  end
end
ObsequiousImpTwo.new.greet("Cpt", "Nikita Kaz")


# Let's implement first_name, last_name and combine the two into a variable called full_name.
# Notice how the greeting code STILL REMAINS UNCHANGED.
class ObsequiousImpTwo
  def salutation; "Most agreeable to see you"; end
  def greet(title, first_name, last_name)
    full_name   = "#{first_name} #{last_name}"
    progname    = "Dis-organizer"
    version     = "Mark 7"
    designation = "Seeree"
    service_inquiry = "order you a coffee"

    puts "\n\n\n"
    puts "#{salutation}, #{title} #{full_name}. ",
         "Welcome to #{progname} version #{version}. ",
         "My name is #{designation}.",
         "May I #{service_inquiry}?"
  end
end
ObsequiousImpTwo.new.greet("Cpt", "Nikita", "Kaz")

# Let's take out version and progname. version into a module and progname into a GLOBAL method.
# We'll reference the version number directly by INCLUDING it in the class. Like a mix-in.

def progname; "Disorganizer"; end

module DisOrganizer
  def version; "Mark 7"; end
end

class ObsequiousImpTwo
  include DisOrganizer
  def salutation; "Most agreeable to see you"; end
  def greet(title, first_name, last_name)
    full_name   = "#{first_name} #{last_name}"
    designation = "Seeree"
    service_inquiry = "order you a coffee"

    puts "\n\n\n"
    puts "#{salutation}, #{title} #{full_name}. ",
         "Welcome to #{progname} version #{version}. ",
         "My name is #{designation}.",
         "May I #{service_inquiry}?"
  end
end

#Lesson learned: The second way of doing it didn't modify the greeting message.
# We only modified WHERE the values came from. Greeting itself shouldn't care where the values
# come from. It just needs the values. Greeting should only be concerned with how it TIES those
# values together into a human readable string.

#A Bareword is a PERL word. Our barewords were {title}, {progname}, {version}. Notice how flexible these were.
#If we had used an instance variable @title, @progname, we'd have to change a LOT. Using barewords, we can
#Flexibly change the source of the data for the bareword by keeping it as a variable, instance variable, method, module, etc...
#User barewords where possible before moving into using instance variables, class variables or constants.