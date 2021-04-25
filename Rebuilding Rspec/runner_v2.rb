require 'pry'
# Version #2 of rebuilding Rspec. Using legit 'expect' instead of 'should'.
# July 5, 2020

# &block converts what is in the describe into an object (proc).
# we then run the block object by calling it.
def describe(description, &block)
  puts description
  block.call
end

def expect(actual)
  Actual.new(actual)
end

def eq(expected)
  Expectations::Equal.new(expected)
end

class Actual
  def initialize(actual)
    @actual = actual
  end

  def to(expectation)
    expectation.run(@actual)
  end
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
    # puts ["#{RED}Backtrace:#{RESET}",e.backtrace.reverse, e]
    e.backtrace.reverse.each do |line|
      puts "\t" + line
    end
    puts "\t#{RED}#{e}#{RESET}"
  end
end

# You need a way to express SHOULD. Should should work on ANY object. You need to monkeypatch Object.
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

class Expectations
  class Equal
    def initialize(expected)
      @expected = expected
    end

    def run(actual)
      unless actual == @expected
        raise AssertionError.new("Expected #{@expected.inspect} but got #{actual.inspect}")
      end
    end
  end
end