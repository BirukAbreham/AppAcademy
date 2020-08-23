class Board

  attr_reader :size
  
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n*n
  end

  def [](pair)
    return @grid[pair[0]][pair[1]]
  end

  def []=(pair,value)
    @grid[pair[0]][pair[1]] = value
  end

  def num_ships
    count = 0

    grid_flat = @grid.flatten
    grid_flat.each do |val|
      if val == :S
        count += 1
      end
    end

    return count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battelship!"
      return true
    else
      self[position] = :X
      return false
    end
  end
  
  def place_random_ships
    max_ships = 0.25 * self.size

    while self.num_ships < max_ships
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      pos = [row, col]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
    end
  end

  def self.print_grid(arr)
    arr.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
