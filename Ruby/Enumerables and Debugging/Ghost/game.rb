require './player'

class Game
  
  attr_reader :current_player, :previous_player

  def initialize(fragment='', player_one, player_two)
    @fragment = fragment
    @player_one = Player.new(player_one)
    @player_two = Player.new(player_two)
    @current_player = @player_one
    @previous_player = @player_two

    @dictionary = Hash.new(true)

    line_num = 0
    text = File.open('dictionary.txt').read
    text.gsub!(/\r\n?/, '\n')
    text.each_line do |line|
      @dictionary[line.chomp] = true
    end

    @losses = Hash.new { |hash, key| hash[key] = "" }
    @losses[@player_one.name] = ""
    @losses[@player_two.name] = ""
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
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
      puts "Word fragment <===> #{@fragment}\n"
      self.take_turn(self.current_player)
      self.next_player!
    end

    self.record(self.previous_player)
  end

  def run
    until @losses.any? { |player, loss| loss.length == 5 }
      self.print_result_board
      @fragment = ""
      self.play_round
    end
    winner = @losses.select { |player, loss| loss.length != 5 }
    puts "***   Player #{winner.keys[0]} winns the game   ***"
  end

  def print_result_board
    puts "*"*30
    puts " ".ljust(10," ")+"Result Board"+" ".ljust(10," ")
    puts "*"*30
    @losses.each do |player, loss|
      puts "#{player}".ljust(10, " ") + "|" + "#{loss}".ljust(5, " ")
    end
    puts "*"*30
  end

end
