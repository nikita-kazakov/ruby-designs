require 'pry'
require 'find'


  #
  # def age
  #   @age
  # end
  #
  # # setter method to SET Jim's age.
  # def age=(num)
  #   @age = num
  # end


  # # Getter method to get Jim's name
  # def name
  #   @name
  # end

  #
  # def name_and_age
  #   "My name is #{@name} and my age is #{@age}"
  # end

# end
  #
# class Person
#   # Add getter and setter methods to both name and age.
#   attr_accessor :name, :age
#
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end
#
# jim = Person.new("Jim", 20)
# sally = Person.new("Sally", 40)
# bob = Person.new("Bob", 70)
#
# jim.name
# sally.name
# bob.name
#
#
# class CashRegister
#   attr_reader :cash
#   def initialize(cash)
#     @cash = cash
#   end
#
#   # Added method to deposit cash.
#   def deposit(amount)
#     @cash = @cash + amount
#   end
#
#   # Added method to withdraw cash.
#   def withdraw(amount)
#     @cash = @cash - amount
#   end
# end
#
# cash_register = CashRegister.new(200)
# cash_register.cash
#
# cash_register.deposit(500)
# cash_register.cash
#
# cash_register.withdraw(100)
# cash_register.cash
#
# binding.pry
#
# 1+1

paths = []
path = "/Users/admin/Desktop/ghelms_wordpress/nikzdaru.com/goncharov_vs"
# paths_all = Find.find(path).select { |p| File.directory?(p) } # Selects ONLY directories and sub directories.
paths_all = Find.find(path).select { |p| p}
# paths << paths_all[0]
# paths << paths_all[1]
# paths << paths_all[2]
# paths << paths_all[3]

EXTENSIONS = %w(txt doc pdf htm html psd png jpg jpeg)
# Dir.entries(paths.first).reject { |p| File.directory?(p) } # Get all files from this folder...not directories
# files = Dir.entries(paths.first).reject {|f| File.directory?(f) || f[0].include?('.')}

# files = Dir.entries(paths[3]).select {|f| EXTENSIONS.include?(f.split('.').last)}
# binding.pry
1+1
binding.pry
Dir.chdir(path) do
  File.open('index.htm', 'w') do |file|
    file.write "<link rel='stylesheet' href='/Users/admin/Desktop/ghelms_wordpress/nikzdaru.com/css/goncharov_css.css'>"
    paths_all.each do |path|
      relative_path = path.split('nikzdaru.com').last
      file.write "<div class='content'>"
      file.write "<img src='..#{relative_path}'>" if %w(png gif jpg jpeg).include?(path.split('.').last)
      file.write "<a href='..#{relative_path}'>#{relative_path}</a>"
      file.write "</div>"
    end
  end
end

# Dir.chdir(paths[3]) do
#   File.open('index.htm', 'w') do |file|
#     file.write "<link rel='stylesheet' href='/Users/admin/Desktop/ghelms_wordpress/nikzdaru.com/css/goncharov_css.css'>"
#     files.each do |f|
#       file.write "<div class='content'>"
#       file.write "<img src='#{f}'>" if %w(png gif jpg jpeg).include?(f.split('.').last)
#       file.write "<a href='#{f}'>#{f}</a>"
#       file.write "</div>"
#     end
#   end
# end