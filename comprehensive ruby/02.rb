#Let's talk about the SELECT method. It's an enumerator.
#In 1 line of code we can do what requires many lines of codes in other languages.

#We're given an array of integers. We only want to grab even integers. How do we do that?
numbers = (1..10).to_a
result = numbers.select do |number|
  number.even?
end

p result # [2, 4, 6, 8, 10]

#You can short hand this:
p numbers.select{|number| number.even?} #[2, 4, 6, 8, 10]

#You'll also see this.
#If you put ampersand in front of a symbol like this, you're able to skip the other syntax.
p numbers.select(&:even?) #<==you'll see this in a lot of ruby real life projects.

#What if we wanted to grab a sentence and only return words that are over 5 letters in a sentence?
#Given an array of strings, return words that are over 5 letters.

#Below is my personal solution. A bit long but works.
string = "This is nikita and whoever thought I am best."
result =  string.split.select do |word|
  word.chars.count > 5 #["nikita", "whoever", "thought"]
end

p result

#Here's what the guy did in the video.
string = "This is nikita and whoever thought I am best."
result =  string.split.select do |word|
  word.length > 5 #["nikita", "whoever", "thought"]
end

p result


#Return all of the vowels.
arr = "a f d s e w a o g".split
result = arr.select do |vowel|
  vowel=~ /[aeiou]/ #This is a REGEX. We'll talk about this later...
end

p result #["a", "e", "a", "o"]





#MAP Method is an enumerable. This is a VERY Popular method.  you'll use it a lot and you'll see it alot.
#Say we have an array of strings and we want to convert all those into numbers.

#You'll see this in real life when you use an API. They return values as JSON...as strings.
arr = ["1", "23.0", "0", "4"]

result = arr.map{|x| x.to_i}
p result  #[1, 23, 0, 4]

#You can also shortcut that:
p result = arr.map(&:to_i) #[1, 23, 0, 4]

#Let's do another example
arr = ("a".."g").to_a #["a", "b", "c", "d", "e", "f", "g"]
p arr.map{|i| i*2} # ["aa", "bb", "cc", "dd", "ee", "ff", "gg"]


#Inject method. Great for totalling or summing up values.
numbers = [1,2,3,4,5]
p numbers.inject(&:+) #15
p numbers.inject(&:*) #120
#or long way:
p numbers.inject{|sum, n| sum + n}


#On Ruby Conditionals