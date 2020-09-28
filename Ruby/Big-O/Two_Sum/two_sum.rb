require "byebug"
# Two sum problem
#
# two_sum?
#
# Given an array of unique integers and a target
# sum, determine whether any two integers in the
# array sum to that amount.
#
# def two_sum?(arr, target_sum)
#   # your code here...
# end

# arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false

# Brute force
#
# Let's start by implementing the brute force solution.
# Write a method called bad_two_sum?, which checks every
# possible pair.
# 
# Make sure that you don't pair an element with itself.
# However, you don't need to bother checking for summing
# the same pair twice; that won't affect your result.

# time complexity is O(n^2)
def bad_two_sum?(arr, target)
  (0...arr.length).each do |idx1|
    return true if arr[idx1] == target
    (idx1+1...arr.length).each do |idx2|
      return true if (arr[idx1] + arr[idx2]) == target
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# puts bad_two_sum?(arr, 6) # => should be true
# puts bad_two_sum?(arr, 10) # => should be false

# Sorting
#
# As a person of elevated algorithmic sensibilities, 
# the brute-force approach is beneath you. Leave that
# nonsense to the riffraff. Instead, you'll apply a 
# refined and time-honored technique: sorting.

# Sort your data, then try to solve the problem.

# What does sorting do to the lower bound of your 
# time complexity?
# How might sorting that make the problem easier?
# Write a second solution, called okay_two_sum?, 
# which uses sorting. Make sure it works correctly.

# Hint: (There are a couple ways to solve this problem
# once it's sorted. One way involves using a very cheap
# algorithm that can only be used on sorted data sets.
# What are some such algorithms you know?)

# the sorting has a time complexity of O(n*log n)
# but if the arr is sorted the lower bound algorithm
# takes time complexity of O(n)
def okay_two_sum?(arr, target)
  arr = arr.sort
  (0...arr.length).each do |idx|
    diff = target - arr[idx]
    return true if arr.include?(diff) && idx != arr.index(diff)
  end
  false
end

# puts "-"*6
# arr = [0, 1, 5, 7]
# puts okay_two_sum?(arr, 6) # => should be true
# puts okay_two_sum?(arr, 10) # => should be false

# Hash Map
#
# Finally, it's time to bust out the big guns: a hash map.
# Remember, a hash map has O(1) #set and O(1) #get, so you
# can build a hash out of each of the n elements in your 
# array in O(n) time. That hash map prevents you from having
# to repeatedly find values in the array; now you can just 
# look them up instantly.

# See if you can solve the two_sum? problem in linear time 
# now, using your hash map.

# Once you're finished, make sure you understand the time 
# complexity of your solutions and then call over your TA 
# and show them what you've got. Defend to them why each of
# your solutions has the time complexity you claim it does.

def two_sum?(arr, target)
  hash = {}
  arr.each do |el|
    if hash[target - el]
      return true
    end
    hash[el] = true
  end
  false
end

# puts "-"*6
# arr = [0, 1, 5, 7]
# puts two_sum?(arr, 6) # => should be true
# puts two_sum?(arr, 10) # => should be false
