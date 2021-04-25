require 'pry'
class Bottles

  def initialize
  end

  def verse(num)
    @number = num
    phrase = first_sentence(@number) +
        second_sentence(@number) +
        third_sentence(@number)
    @number -= 1
    phrase << ending(@number)
  end

  def first_sentence(num)
    if num > 0
      "#{num} #{pluralize_bottles(num)} of beer on the wall, "
    else
      "No more bottles of beer on the wall, "
    end
  end

  def second_sentence(num)
    if num > 0
      "#{num} #{pluralize_bottles(num)} of beer.\n"
    else
      "no more bottles of beer.\n"
    end
  end

  def third_sentence(num)
    if num > 1
      "Take one down and pass it around, "
    elsif num == 1
      "Take it down and pass it around, "
    else
      "Go to the store and buy some more, "
    end

  end

  def ending(num)
    if num >= 1
      "#{num} #{pluralize_bottles(num)} of beer on the wall.\n"
    elsif num == 0
      "99 bottles of beer on the wall.\n"
    else
      "no more bottles of beer on the wall.\n"
    end
  end

  def pluralize_bottles(num)
    if num > 1
      "bottles"
    elsif num == 1
      "bottle"
    end
  end


end

# binding.pry
puts Bottles.new.verse(2)
