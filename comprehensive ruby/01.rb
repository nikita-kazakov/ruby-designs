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

#String Substitution
str = "The quick brown fox jumped over the quick dog"
p str.sub("fox", "eagle") #The quick brown eagle...