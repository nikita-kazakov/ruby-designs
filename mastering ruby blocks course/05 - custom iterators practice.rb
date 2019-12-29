#December 29, 2019 - Custom Iterators Practice

def space
  puts "\n\n"
end

#You're creating a music management program where songs are
#organized into playlists (collection) of songs. You want to be
#able to iterate through all songs in that playlist.

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end
end

song1 = Song.new("Light My Fire", "The Doors", 3)
song2 = Song.new("Outlaw Woman", "Hank Williams Jr.", 5)
song3 = Song.new("Shine on you crazy diamond", "Pink Floyd", 22)


class Playlist
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end
end

playlist = Playlist.new("awesome playlist")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

#You want to be able to call
# playlist.each{|song| song.play}

class Playlist
  def each
    @songs.each {|s| yield s}
  end
end
playlist.each{|song| song.play}

space

#Let's say you want to call playlist.play_songs and play all songs now.
#Notice we're being flexibile in assigning responsibilities to a this class.
#Playlist is now an ADAPTER. it just connects to Song class method play. Flexible!

class Playlist
  def play_songs
    @songs.each {|song| song.play}
  end
end
playlist.play_songs

#If you add an each method to your playlist, you can add an ENNUMERABLE for ALL OTHER BLOCKS.
class Playlist
  include Enumerable
end

p playlist.select{|song| song.duration > 10}
#Shine on your crazy diamond.


#Let's say that to publish the songs, they need to have hyphens between
#all of the words followed by 3 extensions: mp3, wav, aac.

#the result should look like this:
    # okie-from-muskogee-merle.mp3
    # okie-from-muskogee-merle.wav
    # okie-from-muskogee-merle.aac
