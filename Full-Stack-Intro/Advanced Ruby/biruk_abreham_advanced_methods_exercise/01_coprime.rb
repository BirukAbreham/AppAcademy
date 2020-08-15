# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
  num_1_divisors = divisors(num_1)
  num_2_divisors = divisors(num_2)
  return num_1_divisors.one? { |el| num_2_divisors.include?(el) }
end

def divisors(num)
  divisor_arr = []
  (1...num).each do |el|
    if num % el == 0
        divisor_arr << el
    end
  end
  return divisor_arr
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
