class Player
  
  def get_move
    puts "enter a position with coordinates separated with a space like `4 7`"
    input = gets.chomp
    input_arr = input.split(" ")
    return input_arr.map { |el| el.to_i }
  end

end
