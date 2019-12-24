module University
  class Course
    attr_accessor :name, :duration
    def initialize(name:, duration:)
      @name = name
      @duration = duration
    end
  end
end

COURSES = {
  physics: University::Course.new(name: "Physics", duration: 5),
  algebra: University::Course.new(name: "Algebra", duration: 7),
  calculus: University::Course.new(name: "Calculus", duration: 30),
}

p COURSES[:physics].duration #5 <=but 5 what!? Years, days, months?
p COURSES[:calculus].duration #30 <=but 30 what!? Years, days, months?

#We could do if statements to display the duration correctly but that's a pain in the ass.
#There has to be a better way.

#Let's introduce a family of objects to represent duration.

class Duration
  def self.[](magnitude)
    new(magnitude)
  end

  def initialize(magnitude)
    @magnitude = magnitude
    freeze #freezes itself to become an non-mutable value.
  end

  attr_reader :magnitude

  #we'll add handy inspect and to_s methods to this class Duration.
  def inspect
    "#{self.class}[#{magnitude}]"
  end

  def to_s
    "#{magnitude} #{self.class.name.downcase}"
  end

  alias_method :to_i, :magnitude
end

#Now that we have a base class in place, let's derive subclasses for days, weeks, months.
class Days < Duration

end

p COURSES[:calculus].duration = Days[2]
p COURSES[:calculus]

x = lambda{"hi".reverse}
puts x