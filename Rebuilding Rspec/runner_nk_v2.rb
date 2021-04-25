# Try to add RSPEC expect clause

require 'pry'

GREEN = "\e[32m"
RED =   "\e[31m"
RESET = "\e[0m"


def describe(description, &block)
  puts description
  block.call
end

def it(description, &block)
  begin
  block.call
  puts "  #{GREEN}#{description}#{RESET}"
  rescue => e
    puts "  #{RED}#{description}#{RESET}"
    messages = [e, "Backtrace:", e.backtrace.reverse].flatten
    messages.each{|line| puts "    #{line}"}
  end
end

def expect(arg)
  CompareAssertion.new(self)
end

class Object
  def should
    CompareAssertion.new(self)
  end
end

class CompareAssertion
  def initialize(actual)
    @actual = actual
  end

  def to(arg)
  end


  def ==(expected)
    unless @actual == expected
      raise RuntimeError.new("Expected #{expected} but got #{@actual}")
    end
  end
end
