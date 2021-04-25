# Keep this file simple. It's a csv.

new_task = ARGV[0]
File.open('todo.txt', 'a') do |file|
  file.puts "#{new_task},#{Time.now}"
  puts "Task Added."
end