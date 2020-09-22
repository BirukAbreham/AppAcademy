require_relative "polytree"

class KnightPathFinder

  DELTAS = [ 
    [-1, -2], 
    [1, -2], 
    [-2, -1], 
    [2, -1], 
    [-2, 1], 
    [2, 1], 
    [-1, 2], 
    [1, 2] 
  ]

  attr_reader :root_node

  def initialize(init_pos)
    @root_node = PolyTreeNode.new(init_pos)
    @considered_positions = [init_pos]
    self.build_move_tree
  end

  def find_path(end_pos)
  end

  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      present_node = queue.shift
      possible_moves = self.new_move_positions(present_node.value)
      possible_nodes = possible_moves.map { |position| PolyTreeNode.new(position) }
      possible_nodes.each do |node|
        present_node.add_child(node)
      end
      queue = [ *queue, *possible_nodes ]
    end
  end

  def new_move_positions(pos)
    return [] if !KnightPathFinder.valid_moves(pos)
    valid_pos = []
    p_x, p_y = pos
    DELTAS.each do |d_x, d_y|
      valid_pos << [ p_x+d_x, p_y+d_y ]
    end
    valid_pos = valid_pos.select do |pos| 
      !@considered_positions.include?(pos) && KnightPathFinder.valid_moves(pos)
    end
    @considered_positions += valid_pos
    valid_pos
  end

  def self.valid_moves(pos)
    return true if pos.all? { |el| el >= 0 && el < 8 }
    false
  end

end
