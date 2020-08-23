require_relative "board"
require_relative "player"

class Battleship

  attr_reader :player, :board
  
  def initialize(len)
    @player = Player.new
    @board = Board.new(len)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts @board.num_ships
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      return true
    else
      return false
    end
  end

  def win?
    if @board.num_ships <= 0
      puts 'you win'
      return true
    else
      return false
    end
  end

  def game_over?
   if self.win? || self.lose?
    return true
   else
    return false
   end
  end

  def turn
    player_move = @player.get_move
    move_output = @board.attack(player_move)

    if !move_output
      @remaining_misses -= 1
    end

    @board.print
    puts "remaining misses: #{@remaining_misses}"
  end

end
