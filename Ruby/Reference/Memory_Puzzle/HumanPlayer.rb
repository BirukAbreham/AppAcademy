class HumanPlayer

  def initialize
  end

  def player_guess
    puts "Please enter the position of the card you'd like to flip (e.g., '2, 3')"
    position = gets.chomp
    position = position.split(",")
    return position.map { |idx| idx.to_i }
  end

  def receive_revealed_card
  end

  def receive_match
  end
  
end
