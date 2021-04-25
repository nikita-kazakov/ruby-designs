# Sets task as done.
require 'pry'

task_number = ARGV[0].to_i
File.open('todo.txt', 'r+')do |file|
  lines = file.readlines
  lines[task_number-1] = lines[task_number-1].chomp + ",#{Time.now}\n"
  file.rewind
  lines.each do |line|
    file.puts line
  end
end