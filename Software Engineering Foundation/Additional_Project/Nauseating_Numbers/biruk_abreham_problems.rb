# Phase 1. No big deal
def strange_sums(nums)
  dist_zero = 0

  (0...nums.length-1).each do |n|
    (n+1...nums.length).each do |i|
      if (nums[n]+nums[i]) == 0
        dist_zero += 1
      end
    end
  end

  return dist_zero
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

def pair_product(nums, product)
  (0...nums.length-1).each do |n|
    (n+1...nums.length).each do |i|
      if (nums[n]*nums[i]) == product
        return true
      end
    end
  end

  return false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
  new_str = ""
  
  str.each_char do |char|
    if hash.has_key?(char)
      new_str += char*hash[char]
    else
      new_str += char
    end  
  end

  return new_str
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
  return true if num == 1
  (1...num).each do |n|
    if num/n == n && num%n == 0
      return true
    end
  end

  return false
end

def perfect_square_sln(num)
  (1..num).any? { |i| i*i == n }
end

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false

# Phase 2. Nothing you cannot handle

def anti_prime?(num)
  num_fact_len = factors(num).length

  (2...num).each do |n|
    n_fact_len = factors(n).length
    if n_fact_len > num_fact_len
      return false
    end
  end

  return true
end

def factors(num)
  fact = []

  (1..num).each do |n|
    fact << n if num%n == 0
  end

  return fact
end

def anti_prime_sln?(n)
  amount = num_factors(n)
  (1...n).all? { |i| amount > num_factors(i) }
end

def num_factors(n)
  (1..n).count { |i| n % i == 0 }
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

# require "byebug"

def matrix_addition(matrix_one, matrix_two)
  row = matrix_one.length
  col = matrix_one[0].length
  martix_sum = Array.new(row) { Array.new(col, nil) }
  
  # debugger

  (0...row).each do |i|
    (0...col).each do |j|
      martix_sum[i][j] = matrix_one[i][j] + matrix_two[i][j]
    end
  end

  return martix_sum
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
  common_fact = []
  
  max_val = nums.max
  (1..max_val).each do |n|
    is_common = nums.all? { |el| el%n == 0 }
    if is_common
      common_fact << n
    end
  end

  return common_fact
end

def factors_sln(num)
  (1..num).select { |i| num % i == 0 }
end

def mutual_factors_sln(*nums)
  nums.map { |n| factors_sln(n) }.inject(:&)
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

def tribonacci_number(seq)
  if seq == 1 || seq == 2
    return 1
  elsif seq == 3
    return 2
  end

  return tribonacci_number(seq-1)+tribonacci_number(seq-2)+tribonacci_number(seq-3)
end

def tribonacci_number_sln(n)
  seq = [1, 1, 2]
  while seq.length <= n
    seq << seq[-3] + seq[-2] + seq[-1]
  end
  seq[-1]
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274

# Phase 3: Now we're having fun

# require "byebug"

def matrix_addition_reloaded(*matrices)
  return matrices[0] if matrices.length == 1
  
  sum_mat = nil

  # debugger

  (0...matrices.length-1).each do |n|
    temp = nil
    if sum_mat.nil?
      temp = matrices[n]
    else
      temp = sum_mat
    end
    if check_rowcol?(temp, matrices[n+1])
      neigbhor_sum = matrix_addition(temp, matrices[n+1])
      sum_mat = neigbhor_sum
    else
      return nil
    end
  end

  return sum_mat
end

def check_rowcol?(mat_x, mat_y)
  mat_x.length == mat_y.length && mat_x[0].length == mat_y[0].length
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
  (0...arr.length).each do |i|
    x = arr[i]
    y = []
    (0...arr.length).each { |j| y << arr[j][i] }
    if x.uniq.length == 1 || y.uniq.length == 1
      return true
    end
  end
  return false
end

def squarocol_sln?(grid)
  return true if grid.any? { |row| row.uniq.length == 1 }
  return true if grid.transpose.any? { |col| col.uniq.length == 1 }
  false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

def squaragonal?(arr)
  p_d = []
  n_d = []
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      p_d << arr[i][j] if i == j
      n_d << arr[i][j] if (i+j) == (arr.length - 1)
    end
  end
  if p_d.uniq.length == 1 || n_d.uniq.length == 1
    return true
  end
  false
end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true
p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

# require "byebug"

def pascals_triangle(level)
  pascal_arr = []

  (1..level).each do |l|
    if l == 1
      pascal_arr << [l]
    elsif l == 2
      pascal_arr << [1, 1]
    else
      m = l/2
      if l.odd?
        base = pascal_arr[-1][0...m]
        new_arr = [base[0]]
        (0...base.length-1).each { |i| new_arr << base[i] + base[i+1] }
        pascal_arr << new_arr + [ 2*base[-1] ] + new_arr.reverse
      else
        base = pascal_arr[-1][0...m]
        new_arr = [base[0]]
        (0...base.length-1).each { |i| new_arr << base[i] + base[i+1] }
        pascal_arr << new_arr + new_arr.reverse
      end
    end
  end

  return pascal_arr
end

def adjacent_sums(arr)
  sums = []
  (0...arr.length-1).each do |i|
    sums << arr[i] + arr[i + 1]
  end
  sums
end

def pascals_triangle_sln(n)
  triangle = [[1]]
  while triangle.length < n
    level_above = triangle.last
    next_level = [1]
    next_level += adjacent_sums(level_above)
    next_level << 1
    triangle << next_level
  end
  triangle
end


p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],  ---------------------- 1
#     [1, 1], -------------------- 2
#     [1, 2, 1], ----------------- 3
#     [1, 3, 3, 1], -------------- 4
#     [1, 4, 6, 4, 1], ----------- 5
#     [1, 5, 10, 10, 5, 1], ------ 6
#     [1, 6, 15, 20, 15, 6, 1] --- 7
# ]

def mersenne_prime(val)
  mers_arr = []
  
  i = 0
  while mers_arr.length < val
    mers = (2**i)-1
    if prime?(mers)
      mers_arr << mers
    end
    i += 1
  end

  return mers_arr[-1]
end

def prime?(num)
  return false if num < 2

  (2...num).each do |n|
    if num%n == 0
      return false
    end
  end

  return true
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071

def triangular_word?(word)
  alphabet = ("a".."z").to_a
  encode = 0
  word.each_char { |char| encode += alphabet.index(char) + 1}
  
  i = 1
  tri = 0
  while tri < encode
    tri = (i * (i + 1)) / 2
    i += 1
  end

  return tri == encode
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false

# require "byebug"

def consecutive_collapse(nums)
  # debugger

  is_collapsed = false
  while !is_collapsed
    is_collapsed = true
    temp = nums.dup
    (0...nums.length-1).each do |i|
      if nums[i] + 1 == nums[i+1] || nums[i] - 1 == nums[i+1]
        is_collapsed = false
        temp = nums[0...i] + nums[i+2..-1]
        break
      end
    end
    nums = temp.dup
  end
  return nums
end

def collapse(nums)
  (0...nums.length-1).each do |i|
    if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i+1]+1
      return nums[0...i] + nums[i+2..-1]
    end
  end
end

def consecutive_collapse_sln(numbs)
  numbs.each { numbs = collapse(numbs) }
  numbs
end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []

def next_prime(num, i)
  step = 1
  if i < 0
    i = -(i)
    step = -(step)
  end

  prime_count = 0
  while prime_count < i
    return nil if num < 0
    num += step
    prime_count += 1 if prime?(num)
  end
  num
end

def pretentious_primes(arr, num)
  nums.map { |num| next_prime(num, n) }
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
