require_relative "code"

class Mastermind
  
  def initialize(len)
    @secret_code = Code.random(len)
  end

  def print_matches(code_inst)
    puts "exact-match => #{@secret_code.num_exact_matches(code_inst)}"
    puts "near_match => #{@secret_code.num_near_matches(code_inst)}"
  end

  def ask_user_for_guess
    puts "Enter a code"
    guessed = gets.chomp
    code_guessed = Code.from_string(guessed.upcase)
    self.print_matches(code_guessed)
    return @secret_code == code_guessed
  end

end
