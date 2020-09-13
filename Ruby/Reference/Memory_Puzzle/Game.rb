# require 'byebug'
require_relative 'Board'
require_relative 'HumanPlayer'

class Game

  def initialize
    @board = Board.new
    @board.populate
    @guessed_pos = nil
    @previous_guess = nil
    @human_player = HumanPlayer.new
  end

  def play
    @board.render
    until @board.won?
      @guessed_pos = @human_player.player_guess
      self.make_guess
      @board.render
    end
    self.game_over
  end

  def make_guess
    # debugger
    if @previous_guess.nil?
      @previous_guess = @guessed_pos
      guessed_card = @board[@guessed_pos]
      guessed_card.reveal
    else
      guessed_card = @board[@guessed_pos]
      previous_card = @board[@previous_guess]
      if guessed_card == previous_card
        guessed_card.reveal
      else
        guessed_card.reveal
        system("clear")
        @board.render
        sleep 1.5
        guessed_card.hide
        previous_card.hide
      end
      @previous_guess = nil
    end
    system("clear")
  end

  def game_over
    puts "*** Game Over Completed all the Memory Puzzle ***"
  end

end
