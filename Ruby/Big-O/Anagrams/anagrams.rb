# Anagrams
#
# Our goal today is to write a method that determines if 
# two given words are anagrams. This means that the letters 
# in one word can be rearranged to form the other word. 
#
# For example:
#
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in 
# the given strings.

# Phase I:
# Write a method #first_anagram? that will generate and store
# all the possible anagrams of the first string. Check if the
# second string is one of these.

# permutation takes a lot of time
def first_anagram?(str_one, str_two)
  str_one_ls = str_one.split("")
  all_possible_anagrams = str_one_ls.permutation.to_a
  all_possible_anagrams = all_possible_anagrams.map(&:join)
  all_possible_anagrams.include?(str_two)
end

# puts first_anagram?("gizmo", "sally")    #=> false
# puts first_anagram?("elvis", "lives")    #=> true

# puts first_anagram?("abcdefghijk", "kjhgfedcba") # => true
# puts first_anagram?("abcdefghijk", "kjhgfedcbz") # => false

# Phase II:
# Write a method #second_anagram? that iterates over the first 
# string. For each letter in the first string, find the index 
# of that letter in the second string (hint: use Array#find_index)
# and delete at that index. The two strings are anagrams if an 
# index is found for every letter and the second string is empty
# at the end of the iteration.

# Try varying the length of the input strings. What are the 
# differences between #first_anagram? and #second_anagram??

# time complexitiy ==> O(n)
def second_anagram?(str_one, str_two)
  str_one_ls = str_one.split("")
  checker = ""
  str_one_ls.each_with_index do |char, idx|
    if str_two.include?(char)
      char_idx = str_two.index(char)
      checker += str_two[char_idx]
    end
  end
  return true if str_one == checker
  false
end

puts "-"*6
puts second_anagram?("gizmo", "sally")    #=> false
puts second_anagram?("elvis", "lives")    #=> true

puts second_anagram?("abcdefghijk", "kjihgfedcba") # => true
puts second_anagram?("abcdefghijk", "kjhgfedcbz") # => false

# Phase III:
# Write a method #third_anagram? that solves the problem by
# sorting both strings alphabetically. The strings are then
# anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better 
# or worse than #second_anagram??

# time complexity ==> O(nlog(n)) - accounting for 
# the sort algorithm on both strings
def third_anagram?(str_one, str_two)
  str_one = str_one.split("").sort.join
  str_two = str_two.split("").sort.join
  str_one == str_two
end

puts "-"*6
puts third_anagram?("gizmo", "sally")    #=> false
puts third_anagram?("elvis", "lives")    #=> true

puts third_anagram?("abcdefghijk", "kjihgfedcba") # => true
puts third_anagram?("abcdefghijk", "kjhgfedcbz") # => false

# Phase IV:
# Write one more method #fourth_anagram?. This time, use 
# two Hashes to store the number of times each letter 
# appears in both words. Compare the resulting hashes.

# What is the time complexity?
# time complexity = O(n)
# Bonus: Do it with only one hash.
def fourth_anagram?(str_one, str_two)
  return false if str_one.length != str_two.length
  hash = Hash.new(0)
  both_str = str_one+str_two
  both_str.each_char { |str| hash[str] += 1 }
  return true if hash.length == str_one.length
  false
end

puts "-"*6
puts fourth_anagram?("gizmo", "sally")    #=> false
puts fourth_anagram?("elvis", "lives")    #=> true

puts fourth_anagram?("abcdefghijk", "kjihgfedcba") # => true
puts fourth_anagram?("abcdefghijk", "kjihgfedcbz") # => false
