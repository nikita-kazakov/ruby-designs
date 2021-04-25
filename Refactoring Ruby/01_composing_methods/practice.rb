require 'pry'

10.times do |num|
  puts "=" * num
  puts "==" * num
  puts "===" * num
  sleep 0.2
  system 'clear'
end