# Let's rebuild Rspec from scratch following destroyallsoftware.com
# July 5, 2020

# &block converts what is in the describe into an object (proc).
# we then run the block object by calling it.
def describe(description, &block)
  puts description
  block.call
end

# ANSI Color Codes
GREEN = "\e[32m"
RED =   "\e[31m"
RESET = "\e[0m"

# 'it' also has stuff within it. We take that and convert it to an object (&block). a Proc.
def it(description, &block)
  begin
    # We're adding stdout.write instead of puts because this way it stays on the same line. We can add things to this line later!
    $stdout.write "  - #{description}"
    block.call
    puts " #{GREEN}(ok)#{RESET}"
  rescue => e
    puts " #{RED}(fail)#{RESET}"
    puts e
    puts e.backtrace
  end
end

# You need a way to express SHOULD. Should should work on ANY object. You need to moneypatch Object.
class Object
  def should
    ComparisonAssertion.new(self)
  end
end

class ComparisonAssertion
  def initialize(actual)
    @actual = actual
  end

  def ==(expected)
    unless @actual == expected
      raise AssertionError.new("Expected #{expected.inspect} but got #{@actual.inspect}")
    end
  end
end

class AssertionError < RuntimeError
end