require 'byebug'
# Warmup
#
# Write a recursive method, range, that takes a start and
# end and returns an array of all numbers in that range, 
# exclusive. For example, range(1, 5) should return [1, 2
# 3, 4]. If end < start, you can return an empty array.
#
# Write both

def range_recursive(start_idx, end_idx)
  return [] if end_idx <= start_idx
  [ *[start_idx], *range_recursive(start_idx+1, end_idx) ]
end

# p range_recursive(1, 5) # [1, 2, 3, 4]

def range_iterative(start_idx, end_idx)
  range = []
  (start_idx...end_idx).each do |idx|
    range << idx
  end
  range
end

# p range_recursive(1, 5) # [1, 2, 3, 4]

# Exponentiation
#
# Write two versions of exponent that use two different
# recursions:

def exponentv1(num, pow)
  return 1 if pow == 0
  num*exponentv1(num, pow-1)
end

# p exponentv1(2, 5)     # 32
# p exponentv1(10, 0)    # 1
# p exponentv1(3, 4)     # 81
# p exponentv1(100, 2)   # 10000
# p exponentv1(0, 1)     # 0
# p exponentv1(1, 1)     # 1
# p exponentv1(2, 1)     # 2

def exponentv2(num, pow)
  return 1 if pow == 0
  if pow == 1
    return num
  elsif pow > 1 && pow.even?
    (exponentv2(num, pow/2))**2
  elsif pow > 1 && pow.odd?
    num*((exponentv2(num, (pow-1)/2))**2)
  end
end

# p exponentv2(2, 5)     # 32
# p exponentv2(10, 0)    # 1
# p exponentv2(3, 4)     # 81
# p exponentv2(100, 2)   # 10000
# p exponentv2(0, 1)     # 0
# p exponentv2(1, 1)     # 1
# p exponentv2(2, 1)     # 2

# Deep dup
# 
# The #dup method doesn't make a deep copy
#
# Sometimes you want a shallow dup and sometimes
# you want a deep dup. Ruby keeps things simple 
# giving you shallow dup, and letting you write 
# deep dup yourself.
#
# Using recursion and the is_a? method, write an
# Array#deep_dup method that will perform a "deep"
# duplication of the interior arrays.

class Array

  def deep_dup
    copy = []
    self.each do |ele|
      if ele.is_a?(Array)
        copy << ele.deep_dup
      else
        copy << ele
      end
    end
    copy
  end

end

# x = [1, [2], [3, [4]]]
# print "Before copying x : #{x}\n"
# x_deep_copy = x.deep_dup
# print "After copying x to x_deep_copy : #{x_deep_copy}\n"
# x_deep_copy[2] << 5
# print "Adding 5 to the last element of x_deep_copy\n"
# print "x : #{x}\n"
# print "x_deep_copy : #{x_deep_copy}\n"

# Fibonacci
#
# Write a recursive and an iterative Fibonacci method.
# The method should take in an integer n and return 
# the first n Fibonacci numbers in an array.

def fibo_rec(n)
  # debugger
  return [] if n == 0
  if n == 1
    return [1]
  elsif n == 2
    return [1, 1]
  end
  sequence = fibo_rec(n-1)
  next_element = sequence[-1] + sequence[-2]
  sequence << next_element
  return sequence
end

# p fibo_rec(1) # [1]
# p fibo_rec(2) # [1, 1]
# p fibo_rec(3) # [1, 1, 2]
# p fibo_rec(4) # [1, 1, 2, 3]
# p fibo_rec(5) # [1, 1, 2, 3, 5]
# p fibo_rec(6) # [1, 1, 2, 3, 5, 8]
# p fibo_rec(7) # [1, 1, 2, 3, 5, 8, 13]

def fibo_iter(n)
  fibo_arr = []
  (1..n).each do |i|
    if i == 1
      fibo_arr << 1
    elsif i == 2
      fibo_arr << 1
    else
      fibo_arr << fibo_arr[-1] + fibo_arr[-2]
    end
  end
  fibo_arr
end

# p fibo_iter(1) # [1]
# p fibo_iter(2) # [1, 1]
# p fibo_iter(3) # [1, 1, 2]
# p fibo_iter(4) # [1, 1, 2, 3]
# p fibo_iter(5) # [1, 1, 2, 3, 5]
# p fibo_iter(6) # [1, 1, 2, 3, 5, 8]
# p fibo_iter(7) # [1, 1, 2, 3, 5, 8, 13]

# Binary Search
#
# The binary search algorithm begins by comparing the target value to 
# the value of the middle element of the sorted array. If the target 
# value is equal to the middle element's value, then the position is 
# returned and the search is finished. If the target value is less than 
# the middle element's value, then the search continues on the lower 
# half of the array; or if the target value is greater than the middle 
# element's value, then the search continues on the upper half of the 
# array. This process continues, eliminating half of the elements, and
# comparing the target value to the value of the middle element of the
# remaining elements - until the target value is either found (and its 
# associated element position is returned), or until the entire array 
# has been searched (and "not found" is returned).

# Write a recursive binary search: bsearch(array, target). Note that 
# binary search only works on sorted arrays. Make sure to return the 
# location of the found object (or nil if not found!). Hint: you will 
# probably want to use subarrays.

def bsearch(array, target)
  return nil if array[0] != target && array.length <= 1 

  mid_idx = array.length / 2
  
  if array[mid_idx] == target
    return mid_idx
  else
    if array[mid_idx] > target
      bsearch(array[0...mid_idx], target)
    else
      bsearch(array[mid_idx+1..-1], target)
    end
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# iterative solution
#
# def bsearch(array, target)
#   l = 0
#   r = array.length - 1
#   while l <= r
#     m = ((l + r)/2).floor
#     if array[m] < target
#       l = m + 1
#     elsif array[m] > target
#       r = m - 1
#     else
#       return m
#     end
#   end

#   return nil
# end


# Merge Sort
# 
# - The base cases are for arrays of length zero or one.
# Do not use a length-two array as a base case. This is
# unnecessary.
# - You'll want to write a merge helper method to merge
# sorted halves.

def merge_sort(array)
  # debugger
  if array.length <= 1
    return array
  end

  array_size = array.length
  middle = (array.length / 2).round

  left_side = array[0...middle]
  right_side = array[middle...array_size]

  sorted_left = merge_sort(left_side)
  sorted_right = merge_sort(right_side)

  merge(array, sorted_left, sorted_right)

  return array
end

def merge(array, sorted_left, sorted_right)
  left_size = sorted_left.length
  right_size = sorted_right.length

  array_pointer = 0
  left_pointer = 0
  right_pointer = 0

  while left_pointer < left_size && right_pointer < right_size
    if sorted_left[left_pointer] < sorted_right[right_pointer]
      array[array_pointer] = sorted_left[left_pointer]
      left_pointer+=1
    else
      array[array_pointer] = sorted_right[right_pointer]
      right_pointer+=1
    end
    array_pointer+=1
  end

  while left_pointer < left_size
      array[array_pointer] = sorted_left[left_pointer]
      left_pointer+=1
      array_pointer+=1
  end

  while right_pointer < right_size
     array[array_pointer] = sorted_right[right_pointer]
     right_pointer+=1
     array_pointer+=1
  end

  return array
end

x = [9, 7, 8]
y = [5, 4, 10, 3, 2]
z = [ *x, *y ]

p merge_sort(x) # [7, 8, 9]
# p merge_sort(y) # [2, 3, 4, 5, 10]
# p merge_sort(z) # [2, 3, 4, 5, 7, 8, 9, 10]
# p merge_sort([]) # []

class Array
  # Array Subsets
  # Write a method subsets that will return all subsets of an array

  def subsets
    return [] if self.length == 0
    subset = [[self.first]] + self[1..-1].subsets
    return subset
  end

end

# p [].subsets # => [[]]
# p [1].subsets # => [[], [1]]
# p [1, 2].subsets # => [[], [1], [2], [1, 2]]
# p [1, 2, 3].subsets # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# Permutations
#
# Write a recursive method permutations(array) that calculates
# all the permutations of the given array. For an array of length
# n there are n! different permuations. So for an array with three
# elements we will have 3 * 2 * 1 = 6 different permutations.

def permuations(array)
end

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]

# p [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
                              ##   [2, 1, 3], [2, 3, 1],
                              ##   [3, 1, 2], [3, 2, 1]]
