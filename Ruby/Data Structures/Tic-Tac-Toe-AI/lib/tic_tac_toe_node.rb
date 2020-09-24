require_relative 'tic_tac_toe'

class TicTacToeNode
  
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    kids = []

    current_mark = self.next_mover_mark
    @board.each_with_index do |line, row|
      line.each_with_index do |tile, col|
        if tile.nil?
          prev = nil
        end
      end
    end

    kids
  end
end
