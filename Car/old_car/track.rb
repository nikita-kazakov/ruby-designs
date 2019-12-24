require_relative 'db'

class Track
  attr_accessor :length

  def initialize(length = 100)
    @length = length
  end

end