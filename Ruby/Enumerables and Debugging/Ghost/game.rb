require './player'

class Game
  
  attr_reader :current_player, :previous_player

  def initialize(fragment='', *players)
    @fragment = fragment
    @players = players.map { |player| Player.new(player) }
    @current_player = @players[0]
    @previous_player = @players[-1]

    @dictionary = Hash.new(true)

    line_num = 0
    text = File.open('dictionary.txt').read
    text.gsub!(/\r\n?/, '\n')
    text.each_line do |line|
      @dictionary[line.chomp] = true
    end

    @losses = Hash.new { |hash, key| hash[key] = "" }
    @players.each do |player|
      @losses[player.name] = ""
    end
  end

  def next_player!
    @players.rotate!(1)
    @current_player = @players[0]
    @previous_player = @players[-1]
  end

  def take_turn(player)
    string = player.guess
    until self.valid_play?(string)
      player.alert_invalid_guess
      string = player.guess
    end
    @fragment += string
  end

  def valid_play?(string)
    check = @fragment + string
    words = @dictionary.keys
    words.each do |word|
      if word[0...check.length] == check
        return true
      end
    end
    false
  end

  def record(player)
    previous_loss = @losses[player.name]
    case previous_loss.length
    when 0
      @losses[player.name] = "G"
    when 1
      @losses[player.name] = "GH"
    when 2
      @losses[player.name] = "GHO"
    when 3
      @losses[player.name] = "GHOS"
    else
      @losses[player.name] = "GHOST"
    end
  end

  def play_round
    until @dictionary.has_key?(@fragment)
      puts "Word fragment < -- > #{@fragment}\n"
      self.take_turn(self.current_player)
      self.next_player!
    end

    self.record(self.previous_player)
    self.eliminate_player
  end

  def eliminate_player
    @losses.each do |player_name, loss|
      if loss == "GHOST"
        @losses.delete(player_name)
        @players = @players.select { |player| player.name != player_name }
        @previous_player = @players[-1]
      end
    end
  end

  def run
    until @players.length == 1
      self.display_standings
      @fragment = ""
      self.play_round
    end
    puts "***   Player #{@players[0].name} winns the game   ***"
  end

  def display_standings
    puts "*"*30
    puts " ".ljust(10," ")+"Result Board"+" ".ljust(10," ")
    puts "*"*30
    @losses.each do |player, loss|
      puts "#{player}".ljust(10, " ") + "|" + "#{loss}".ljust(5, " ")
    end
    puts "*"*30
  end

end
