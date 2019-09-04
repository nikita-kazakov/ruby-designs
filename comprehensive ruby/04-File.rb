

#Here's another way of doing this:
file_to_save = File.new("animals.txt", "w+")
file_to_save.puts("Owl, Dog, Cat")
file_to_save.close

#Using a block is a better way of doing it because you don't need to run the close method.
File.open("teams.txt", "w+") do |f| #<==second argument is options
  f.write("Rockies, Dodgers") #<==it should have created the file 'teams.txt' and wrote this text in it.
end

#Let's read the file we created
teams = File.read("teams.txt")
p teams #"Rockies, Dodgers"
#let's put it into an array.
p teams.split(",")

#What if you want to read multiple files and combine them?
teams1 = File.read("teams.txt")
teams2 = File.read("animals.txt")

p teams1.split(",") << teams2.split{","}


#Let's delete a file. Simple.
File.delete("teams.txt")

#How do you append to a file / update it in Ruby?
10.times do
  sleep 1 #<==sleep for 1 second
  puts "Record saved..."
  File.open("server-logs.txt", "a") do |f|
    f.puts "Server started at :#{Time.new}"
  end

end


# r - reading
# a - appending to files
# w - writing to files
# w+ - reading and writing <==use this most often.
# a+ - open a file for reading and appending
# r+ - open file for updating reading and writing.