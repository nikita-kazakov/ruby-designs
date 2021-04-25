#!/usr/bin/env ruby
require 'pry'
# puts "YO!"
TODO_FILE = 'todo.txt'

command = ARGV[0]


case command
when 'new'
  new_task = ARGV[1]
  File.open(TODO_FILE, 'a') do |file|
    file.puts "#{new_task},#{Time.now}"
    puts "Task Added."
  end
when 'list'
  File.open(TODO_FILE, 'r') do |file|
    file.readlines.each_with_index do |line, index|
      task, time_created, time_completed = line.chomp.split(',')
      puts "#{index + 1} - #{task}"
      puts "    Created: #{time_created}"
      puts "    Done: #{time_created}" if time_completed
      puts "\n"
    end
  end
when 'done'
  task_number = ARGV[1].to_i
  File.open('todo.txt', 'r+') do |file|
    lines = file.readlines
    lines[task_number-1] = lines[task_number-1].chomp + ",#{Time.now}\n"
    file.rewind
    lines.each do |line|
      file.puts line
    end
  end
else
  puts "Unknown Command"
  puts "Try:"
  puts "\t todo.rb new [string]"
  puts "\t todo.rb list"
  puts "\t todo.rb done [task_number]"
end