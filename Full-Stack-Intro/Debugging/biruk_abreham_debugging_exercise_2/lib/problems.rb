# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  prime_factors = []
  (2..num).each do |n|
    if num % n == 0 && prime?(n)
        prime_factors << n
    end
  end
  return prime_factors.max
end

def prime?(num)
    if num < 2
        return false
    end

    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    return true
end

def unique_chars?(str)
    char_hash = Hash.new(0)
    str.each_char { |el| char_hash[el] += 1 }
    if char_hash.values.max > 1
        return false
    end
    return true
end

def dupe_indices(arr)
    hash = {}
    arr.each_with_index do |el, i|
      if hash.has_key?(el)
        hash[el] << i
      else
        hash[el] = [i]
      end
    end
    hash.each do |key, val|
        if val.length <= 1
            # delete from the hash
            hash.delete(key)
        end
    end
    return hash
end

def ana_array(arr_1, arr_2)
  arr_1.each do |el|
    if !arr_2.include?(el)
        return false
    end
  end
  arr_2.each do |el|
    if !arr_1.include?(el)
      return false
    end
  end
  return true
end
