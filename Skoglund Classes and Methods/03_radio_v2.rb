#THIS IS A VERSION 2 of the implementation


#Define Radio class. Controls for volume, frequency, and band (AM/FM)
#In Radio class, make Volume setter, getter, and status to see it's value.


#Now, in the initialize method, we're going to set a default freqency (freq)

#Make sure your frequency stays within the correct range!
#FM: 88.0 to 108.0
#AM: 540.0 to 1600.0
#Also have band and give it a default value. when initialized. Make it read but NOT CHANGED.
#Once we create an Radio.am, it stays an AM radio. When Radio.fm, it stays an fm radio.
#Make status provide frequency, band, and volume.


class Radio
  attr_accessor :volume, :freq
  attr_reader :band

  @@freq_limits_AM = 540..1600
  @@freq_limits_FM = 88..108
  @@freq_default_AM = 540
  @@freq_default_FM =88

  def initialize(volume: 5, band: "FM", freq: @@freq_default_FM)
    @volume = volume
    @band = band
    @freq = freq
  end

  def self.fm
    Radio.new(band: "FM", freq: @@freq_default_FM)
  end

  def self.am
    Radio.new(band: "AM", freq: @@freq_default_AM)
  end

  def volume_knob
    volume_min = 1
    volume_max = 10
    volume_min..volume_max
  end

  def volume=(num)
    @volume = num if volume_knob.include?(num)
  end

  def freq_change(num)
    if @band == "FM"
      freq_change_FM(num)
    else
      freq_change_AM(num)
    end
  end

  def freq_change_FM(num)
    @freq = num if @@freq_limits_FM.include?(num)
  end

  def freq_change_AM(num)
    @freq = num if @@freq_limits_AM.include?(num)
  end


  def status
    puts "station: #{freq} #{band}, volume: #{volume}"
  end


end

p radiofm = Radio.fm
p radiofm.volume
p radiofm.volume = 7
p radiofm.volume = 11
p radiofm.freq_change(90)
p radiofm.freq_change(80)
p radiofm


#Notice that I made default RANGES for the volume knobs.
#I also broke down the change frequency.

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