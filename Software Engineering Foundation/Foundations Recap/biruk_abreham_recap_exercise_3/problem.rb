def no_dupes?(arr)
  hash = Hash.new(0)
  arr.each { |el| hash[el] += 1 }
  return hash.select { |k, v| v == 1 }.keys
end

# print no_dupes?([1, 1, 2, 1, 3, 2, 4])
# puts
# print no_dupes?(['x', 'x', 'y', 'z', 'z'])
# puts
# print no_dupes?([true, true, true])
# puts

def no_consecutive_repeats?(arr)
  (0...arr.length-1).each do |i|
    if arr[i] == arr[i+1]
      return false
    end
  end
  return true
end

# puts no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# puts no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# puts no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# puts no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# puts no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  hash = Hash.new { |h, k| h[k] = [] }
  
  str.each_char.with_index do |char, i|
    hash[char] << i
  end

  return hash
end

# print char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# puts
# print char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
# puts

def longest_streak(str)
  max_streak = 0
  max_char = ''
  
  str.each_char do |char|
    if max_char == char
      max_char += 1

  end

  return max_char*max_streak
end

def longest_streak_sln(str)
  longest = ""
  current = ""

  (0...str.length).each do |i|
    if str[i] == str[i - 1] || i == 0
      current += str[i]
    else
      current = str[i]
    end

    if current.length >= longest.length
      longest = current
    end
  end

  return longest
end

# puts longest_streak('a')           # => 'a'
# puts longest_streak('accccbbb')    # => 'cccc'
# puts longest_streak('aaaxyyyyyzz') # => 'yyyyy
# puts longest_streak('aaabbb')      # => 'bbb'
# puts longest_streak('abc')         # => 'c'

def bi_prime?(num)
  (2...num).each do |i|
    if num%i == 0
      if prime?(i) && prime?(num/i)
        return true
      end
    end
  end

  return false
end

def prime?(num)
  return false if num < 2

  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end

  return true
end

# puts bi_prime?(14)   # => true
# puts bi_prime?(22)   # => true
# puts bi_prime?(25)   # => true
# puts bi_prime?(94)   # => true
# puts bi_prime?(24)   # => false
# puts bi_prime?(64)   # => false

def vigenere_cipher(msg, arr)
  cipher_msg = ""
  i = 0
  msg.each_char do |char|
    if i < arr.length
      cipher_msg += caesare_cipher(char, arr[i])
      i += 1
    else
      i = 0
      cipher_msg += caesare_cipher(char, arr[i])
      i += 1
    end
  end

  return cipher_msg
end

def caesare_cipher(char, key)
  alphabet = ("a".."z").to_a
  return alphabet[ (alphabet.index(char) + key) % alphabet.length ]
end

# puts vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# puts vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# puts vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# puts vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# puts vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
  new_str = ""
  new_vowel = "*"
  str.each_char do |char|
    if "aeiou".include?(char)
      new_str += new_vowel
      new_vowel = char
    else
      new_str += char
    end
  end
  
  return new_str.gsub!("*", new_vowel)
end

def vowel_rotate_sln(str)
  new_str = str[0..-1]
  vowel_indices = (0...str.length).select { |i| vowels.include?(str[i]) }
  new_vowel_indices = vowel_indices.rotate[-1]

  vowel_indices.each_with_index do |vowel_idx, i|
    new_vowel = str[new_vowel_indices[i]]

    new_str[vowel_idx] = new_vowel
  end

  return new_str
end

# puts vowel_rotate('computer')      # => "cempotur"
# puts vowel_rotate('oranges')       # => "erongas"
# puts vowel_rotate('headphones')    # => "heedphanos"
# puts vowel_rotate('bootcamp')      # => "baotcomp"
# puts vowel_rotate('awesome')       # => "ewasemo"

class String
  
  def select(&prc)
    new_str = ""
    prc ||= nil
    
    if prc == nil
      return ""
    else
      self.each_char do |char|
        if prc.call(char)
          new_str += char
        end
      end
    end

    return new_str
  end

  def map!(&prc)
    
    self.each_char.with_index do |char, i|
      self[i] = prc.call(char, i)  
    end
  
  end

end

# puts "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# puts "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# puts "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
  return a if b == 1 || b == -1
  if b > 0
    return a + multiply(a, b - 1)
  elsif b < 0
    return a + multiply(a, b + 1)
  end
end

def multiply_sln(a, b)
  return 0 if b == 0
  
  if b < 0
    return -(a + multiply_sln(a, (-b) - 1))
  else
    return a + multiply_sln(a, b - 1)
  end
end

# puts multiply(3, 5)        # => 15
# puts multiply(5, 3)        # => 15
# puts multiply(2, 4)        # => 8
# puts multiply(0, 10)       # => 0
# puts multiply(-3, -6)      # => 18
# puts multiply(3, -6)       # => -18
# puts multiply(-3, 6)       # => -18

def lucas_sequence(n)
  if n == 0
    return []
  elsif n == 1
    return [2]
  elsif n == 2
    return [2, 1]
  end

  return lucas_sequence(n-1)
end

def lucas_sequence_sln(n)
  return [] if n == 0
  return [2] if n == 1
  return [2, 1] if n == 2

  seq = lucas_sequence_sln(length - 1)
  next_el = seq[-1] + seq[-2]
  seq << next_el
  return seq
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(4)   # => [2, 1, 3, 4]
# p lucas_sequence(5)   # => [2, 1, 3, 4, 7]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
  if prime?(num)
    return [num]
  end

  (2...num).each do |i|
    if num%i == 0 && prime?(i)
      return prime_factorization(i) + prime_factorization(num/i)
    end
  end

end

def prime_factorization_sln(num)
  (2...num).each do |fact|
    if num % fact == 0
      other_fact = num / fact
      return [ *prime_factorization_sln(fact), *prime_factorization_sln(other_fact)]
    end
  end

  return [ num ]
end


# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]
