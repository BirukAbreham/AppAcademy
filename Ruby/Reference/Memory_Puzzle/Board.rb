# require 'byebug'
require_relative 'Card'

class Board

  def initialize(size=4)
    @grid = Array.new(size) { Array.new(size) }
  end

  def populate
    pair_size = (@grid.length**2)/2
    faces = ('A'..'Z').to_a.shuffle.sample(pair_size)
    hash_populated = Hash.new(0)

    while @grid.flatten.any? { |card| card.nil? }
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      face = faces.sample
      if @grid[row][col].nil? && hash_populated[face] < 2
        @grid[row][col] = Card.new(face)
        hash_populated[face] += 1
      end
    end
  end

  def render
    (0...@grid.length).each do |i|
      if i == 0
        print " ".ljust(3, " ") + "#{i}".ljust(3, " ")
      else
        print "#{i}".ljust(3, " ")
      end
    end
    puts
    @grid.each_with_index do |line, row|
      print "#{row}".ljust(3, " ")
      line.each do |card|
        print "#{card.show_face}".ljust(3, " ")
      end
      puts
    end
  end

  def won?
    @grid.each do |row|
      return false if row.any? { |card| card.face_down == true }
    end
    true
  end

  def reveal(guessed_pos)
    guessed_card = self[guessed_pos]
    if !guessed_card.face_up
      guessed_card.reveal
      return guessed_card.face
    end
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, card)
    @grid[position[0]][position[1]] = card
  end

end
