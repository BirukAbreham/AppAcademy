class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    return DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    end

    return false
  end

  def get_matching_indices(char)
    char_matched = []

    @secret_word.each_char.with_index do |c, i|
      if char == c
        char_matched << i
      end
    end

    return char_matched
  end
  
  def fill_indices(char, array)

    @guess_word.each_with_index do |el, idx|
      if array.include?(idx)
        @guess_word[idx] = char
      end
    end

  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char

      char_matched = self.get_matching_indices(char)

      if(char_matched.length == 0)
        @remaining_incorrect_guesses -= 1
      end
  
      self.fill_indices(char, char_matched)
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guessed_char = gets.chomp
    return self.try_guess(guessed_char)
  end

  def win?
    puts "WIN"
    return @guess_word.join("") == @secret_word
  end

  def lose?
    puts "LOSE"
    return @remaining_incorrect_guesses == 0
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    return false
  end

end
