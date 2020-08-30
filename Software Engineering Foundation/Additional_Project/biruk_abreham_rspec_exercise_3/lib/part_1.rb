def is_prime?(num)
  return false if num < 2

  (2...num).each do |i|
    if num%i == 0
      return false
    end
  end
  
  return true
end

def nth_prime(num)
  all_prime = []

  i = 2
  while all_prime.length < num
    all_prime << i if is_prime?(i)
    i += 1
  end
  
  return all_prime[-1]
end

def prime_range(min, max)
  all_prime = []

  (min..max).each do |i|
    all_prime << i if is_prime?(i)
  end

  return all_prime
end
