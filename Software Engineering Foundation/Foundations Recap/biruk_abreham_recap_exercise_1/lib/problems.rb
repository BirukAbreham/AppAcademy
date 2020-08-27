# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
  vowel_pairs = []
  
  (0...words.length).each do |i|
    (0...words.length).each do |j|
      if j > i
        common_vowels = (word_vowels(words[i]) + word_vowels(words[j])).uniq
        if common_vowels.length == 5
          vowel_pairs << words[i] + " "+words[j]
        end
      end
    end
  end

  return vowel_pairs
end

def word_vowels(word)
  vowels = []

  word.each_char do |char|
    if "aeiou".include?(char) && !vowels.include?(char)
      vowels << char
    end
  end

  return vowels 
end

def all_vowel_pairs_sln(words)
  pairs = []
  vowels = ["a", "e", "i", "o", "u"]
  
  words.each_with_index do |word_1, idx_1|
    words.each_with_index do |word_2, idx_2|
      pair = word_1 + " " + word_2
      pairs << pair if idx_2 > idx_1 && vowels.all? { |vow| pair.include?(vow) } 
    end
  end

  return pairs
end

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
  (2...num).each do |factor|
    if num%factor == 0
      return true
    end
  end

  return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  str_bigrams = []

  str_arr = str.split(" ")

  bigrams.each do |bigram|
    str_arr.each do |word|
      if word.include?(bigram)
        str_bigrams << bigram
      end
    end
  end

  return str_bigrams
end

def find_bigrams_sln(str, bigrams)
  return bigrams.select { |bigram| str.include?(bigram) }
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
      hash = {}

      prc ||= Proc.new { |k, v| k == v }

      self.each do |key, value|
        if prc.call(key, value)
          hash[key] = value
        end
      end
      return hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
      length ||= length
      all = []
      self.each_char.with_index do |char_one, i|
        self.each_char.with_index do |char_two, j|
          if j == i
            all << char_one
          elsif j > i
            all << self[i..j]
          end
        end
      end
      if length
        return all.select { |sub| sub.length == length }
      else
        return all
      end
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
      cipher = ""

      alpha = ("a".."z").each.to_a
      self.each_char.with_index do |char, i|
        new_position = (alpha.index(char) + num)%alpha.length
        cipher += alpha[new_position]
      end

      return cipher
    end
end
