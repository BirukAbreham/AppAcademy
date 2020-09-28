# Execution Time Difference
#

# Given a list of integers find the smallest number
# in the list.

# Phase I
# First, write a function that compares each element 
# to every other element of the list. Return the 
# element if all other elements in the array are 
# larger. What is the time complexity for this function?

# Time complexity is O (n^2)
def my_min_v1(list)
  list.each do |l|
    flag = true
    list.each do |k|
      flag = false if l > k
    end
    return l if flag == true
  end
end

# puts my_min_v1([0, 3, 5, 4, -5, 10, 1, 90]) # -5

# Phase II
# Now rewrite the function to iterate through the 
# list just once while keeping track of the minimum.
# What is the time complexity?

# Time complexity is O(n)
def my_min_v2(list)
  min = list[0]
  (1...list.length).each do |idx|
    min = list[idx] if min > list[idx]
  end
  min
end

# puts my_min_v2([0, 3, 5, 4, -5, 10, 1, 90]) # -5

# Largest Contiguous Sub-sum
#
# You have an array of integers and you want to find 
# the largest contiguous (together in sequence) sub-sum.
# Find the sums of all contiguous sub-arrays and return 
# the max.

# Example:

#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:

#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:

#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])

# Phase I
# Write a function that iterates through the array 
# and finds all sub-arrays using nested loops. First
# make an array to hold all sub-arrays. Then find the
# sums of each sub-array and return the max.

# Time complexity is O(n^2)
def largest_contiguous_subsum_v1(list)
  all_sum = []
  (0...list.length).each do |idx1|
    all_sum << list[idx1]
    (idx1+1...list.length).each do |idx2|
      all_sum << list[idx1..idx2].sum
    end
  end
  all_sum.max
end

puts largest_contiguous_subsum_v1([5, 3, -7]) # => 8
puts largest_contiguous_subsum_v1([2, 3, -6, 7, -6, 7]) # => 8 (from [7, -6, 7])
puts largest_contiguous_subsum_v1([-5, -1, -3]) # => -1 (from [-1])

# Phase II
# Let's make a better version. Write a new function 
# using O(n) time with O(1) memory. Keep a running 
# tally of the largest sum. To accomplish this efficient
# space complexity, consider using two variables. One
# variable should track the largest sum so far and 
# another to track the current sum. We'll leave the 
# rest to you.

# Time complexity is O(n)
def largest_contiguous_subsum_v2(list)
  largest_sum = list.first
  current_sum = list.first

  (1...list.length).each do |idx|
    current_sum = 0 if current_sum < 0
    current_sum += list[idx]
    largest_sum = current_sum if current_sum > largest_sum
  end

  largest_sum
end

puts largest_contiguous_subsum_v2([5, 3, -7]) # => 8
puts largest_contiguous_subsum_v2([2, 3, -6, 7, -6, 7]) # => 8 (from [7, -6, 7])
puts largest_contiguous_subsum_v2([-5, -1, -3]) # => -1 (from [-1])
