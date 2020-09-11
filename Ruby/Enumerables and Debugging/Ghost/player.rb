class Player

  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def guess
    puts "Player #{self.name} => Guess the next letter to make the fragment : "
    input = gets.chomp
    return input
  end

  def alert_invalid_guess
    puts "Invalid value please make a correct guess for the framgment."
  end

end
