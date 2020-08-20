require "byebug"

def is_prime?(number)
    (2...number).each do |factor|
        return false if number % factor == 0
    end

    return number > 1
end

def first_n_primes(num_primes)
  primes = []
  num = 2
  debugger
  while primes.length < num_primes
    primes << num if is_prime?(num)
    num += 1
  end
  return primes
end

p first_n_primes(11)
