class GuessingGame

  def initialize(min_val, max_val)
    @secret_num = rand(min_val..max_val)
    @num_attempts = 0
    @game_over = false
  end
  
  def num_attempts
    @num_attempts
  end
  
  def game_over?
    @game_over
  end
  
  def check_num(guessed_num)

    @num_attempts = @num_attempts + 1

    if (guessed_num == @secret_num)
      @game_over = true
      puts "you win"
    elsif (guessed_num > @secret_num)
      puts "too big"
    elsif (guessed_num < @secret_num)
      puts "too small"
    end

  end

  def ask_user
    puts "enter a number"
    guessed = gets.chomp
    guessed_num = guessed.to_i
    self.check_num(guessed_num)
  end

end
