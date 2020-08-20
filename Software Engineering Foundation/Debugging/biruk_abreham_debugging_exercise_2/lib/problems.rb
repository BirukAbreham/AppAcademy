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

def unique_chars_solution?(string)
  already_seen = []

  string.each_char do |char|
    if already_seen.include?(char)
      return false
    end
    already_seen << char
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

def dupe_indices_solution(array)
  indices = Hash.new { |h, k| h[k] = [] }

  array.each_with_index do |ele, i|
    indices[ele] << i
  end

  return indices.select { |ele, arr| arr.length > 1 }
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

def ele_count(arr)
  count = Hash.new(0)

  arr.each { |ele| count[ele] += 1 }

  return count
end

def ana_array_solution(arr_1, arr_2)
  count_1 = ele_count(arr_1)
  count_2 = ele_count(arr_2)
  return count_1 == count_2
end
