
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



# This is my initial implementation. It's quick and it works. Let's see what we can do to improve it.
class Radio
  attr_accessor :volume, :freq
  attr_reader :band

  def initialize(volume: 5, band: "FM", freq: 95.5)
    @volume = volume
    @band = band
    @freq = freq
  end

  def self.fm
    Radio.new(band: "FM", freq: 95.5)
  end

  def self.am
    Radio.new(band: "AM", freq: 1010.0)
  end

  def volume=(num)
    volume_max = 10
    volume_min = 1

    if num >= volume_min && num <= volume_max
      @volume = num
    end
  end

  def freq=(num)
    if band == "AM"
      @freq = num if num >= 540 && num <= 1600
    elsif band == "FM"
      @freq = num if num >= 88 && num <= 108
    end
  end

  def status
    puts "station: #{freq} #{band}, volume: #{volume}"
  end


end

p radiofm = Radio.fm
p radiofm.volume
p radiofm.volume = 7
p radiofm.volume = 11
p radiofm.freq = 90
p radiofm.freq = 80
p radiofm




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