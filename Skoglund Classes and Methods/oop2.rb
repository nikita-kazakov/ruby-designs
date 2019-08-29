#August 30, 2019
#Let's look at class attributes. These are related to the class itself and not the specific instance.
# @@Variable is class attribute rather than an instance attribute @variable.

class Fighter
  @@types = ['rogue', 'fighter']

  def self.types
    @@types
  end

end

p Fighter.types #<["rogue", "fighter"]

#We can keep track of the amount of objects initialized with the class as well!
class Fighter
  @@count = 0
  @@current_fighters = []
  def initialize
    @@count += 1
    @@current_fighters << self
  end

  def self.count
    @@count
  end

  def self.total
    @@current_fighters
  end
end

fighter1 = Fighter.new
p Fighter.count # 1
fighter2 = Fighter.new
p Fighter.count # 2
#so we now have a way to keep track of ALL the instances that were created!
p Fighter.total # [#<Fighter:0x000055f40d017348>, #<Fighter:0x000055f40d0172a8>]

#What about CLASS reader / writer methods?  There are no attr equivalents for CLASS methods in Ruby. On rails, there is.
#We don't use class reader / writer methods often.  Just do it manually yourself as your would for instance getters / setters.

#Challenge time! (RADIO CHALLENGE)
#Define Radio class. Controls for volume, frequency, and band (AM/FM)
#In Radio class, make Volume setter, getter, and status to see it's value.

class Radio
  attr_accessor :volume

  def status
    @volume
  end

end

#Now, in the initialize method, we're going to set a default freqency (freq)

#Make sure your frequency stays within the correct range!
#FM: 88.0 to 108.0
#AM: 540.0 to 1600.0
#Also have band and give it a default value. when initialized. Make it read but NOT CHANGED.
#Once we create an Radio.am, it stays an AM radio. When Radio.fm, it stays an fm radio.
#Make status provide frequency, band, and volume.

class Radio


#Below tests should pass:
# fm = Radio.fm #@volume = 5, @band = FM, @freq = 95.5
# fm.status # "station: 95.5 FM, volume: 5"
# fm.volume = 8
# fm.status # "station: 95.5 FM, volume: 8"
# fm.volume = 15
# fm.status # "station: 95.5 FM, volume: 8"   <==volume still stays at 8 because 15 is invalid.
# fm.freq = 70 <==shouldn't work. won't modify that status
# fm.freq = 2000 <==shouldn't work. won't modify that status
# fm.band #FM   (You can't change the band though)