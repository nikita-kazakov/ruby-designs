class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

end
puts "Enter the name of the first player"
player_1 = Player.new(gets.chomp)
puts "Enter the name of the second player"
player_2 = Player.new(gets.chomp)
puts "Enter the name of the third player"
player_3 = Player.new(gets.chomp)

class Track

  def initialize(player1, player2, player3, track_length)
    @p1_name = player1
    @p2_name = player2
    @p3_name = player3
    @p1_position = 1
    @p2_position = 1
    @p3_position = 1
    @track_length = track_length
    @round = 1
    @winner = nil
  end

  def create_track
    Array.new(@track_length * 2 + 3) do |x|
      x.even? ? '|' : ' '
    end
  end

  def create_track_for_players
    @p1_track = create_track
    @p2_track = create_track
    @p3_track = create_track
    @p1_track[@p1_position] = @p1_name
    @p2_track[@p2_position] = @p2_name
    @p3_track[@p3_position] = @p3_name
  end

  def update_track_p1
    @p1_track[@p1_position] = " "
    @p1_position += rand(1..3) * 2

    if @p1_position > @track_length * 2 + 1
      @p1_position = @track_length * 2 + 1
    end

    @p1_track[@p1_position] = @p1_name
  end

  def update_track_p2
    @p2_track[@p2_position] = " "
    @p2_position += rand(1..3) * 2

    if @p2_position > @track_length * 2 + 1
      @p2_position = @track_length * 2 + 1
    end

    @p2_track[@p2_position] = @p2_name
  end

  def update_track_p3
    @p3_track[@p3_position] = " "
    @p3_position += rand(1..3) * 2

    if @p3_position > @track_length * 2 + 1
      @p3_position = @track_length * 2 + 1
    end

    @p3_track[@p3_position] = @p3_name
  end

  def clear_screen!
    print "\e[2J"
  end

  def print_track
    puts "Time #{@round}"
    clear_screen!
    @p1_track.each do |segment|
      print segment
    end
    print "\n"
    @p2_track.each do |segment|
      print segment
    end
    print "\n"
    @p3_track.each do |segment|
      print segment
    end
    print "\n"
    @round += 1
  end

  def check_player
    if @p1_position == @track_length * 2 + 1
      @winner = @p1_name
    end

    if @p2_position == @track_length * 2 + 1
      @winner = @p2_name
    end
    if @p3_position == @track_length * 2 + 1
      @winner = @p3_name
    end
  end

  def winner_found?
    !@winner.nil?
  end

  def play

    create_track_for_players
    loop do
      print_track
      update_track_p1
      check_player
      if winner_found?
        print_track
        break
      end
      update_track_p2
      check_player
      if winner_found?
        print_track
        break
      end
      update_track_p3
      check_player
      if winner_found?
        print_track
        break
      end
      sleep(0.2)
    end
    puts "#{@winner} wins!"
  end
end


new_race = Track.new(player_1.name, player_2.name, player_3.name, 61)
new_race.play