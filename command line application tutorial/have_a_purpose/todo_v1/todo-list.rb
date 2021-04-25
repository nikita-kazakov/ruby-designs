require 'pry'
# Reads todo.txt and displays it.

File.open('todo.txt', 'r') do |file|
  file.readlines.each_with_index do |line, index|
    task, time_created, time_completed = line.chomp.split(',')
    puts "#{index + 1} - #{task}"
    puts "    Created: #{time_created}"
    puts "    Done: #{time_created}" if time_completed
    puts "\n"
  end
end