def proper_factors(num)
  fact = []

  (1...num).each do |n|
    fact << n if num%n == 0
  end

  return fact
end

def aliquot_sum(num)
  return proper_factors(num).sum
end

def perfect_number?(num)
  return true if num == aliquot_sum(num)
  return false
end

def ideal_numbers(n)
  perfect_nums = []
  i = 1
  while perfect_nums.length < n
    perfect_nums << i if perfect_number?(i)
    i += 1 
  end

  return perfect_nums
end
