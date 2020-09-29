require "byebug"
# Windowed Max Range

# Max Windowed Range
# Given an array, and a window size w, find the maximum 
# range (max - min) within a set of w elements.

# Let's say we are given the array [1, 2, 3, 5] and a 
# window size of 3. Here, there are only two cases to consider:

# 1. [1 2 3] 5
# 2. 1 [2 3 5]
# In the first case, the difference between the max and min
# elements of the window is two (3 - 1 == 2). In the second 
# case, that difference is three (5 - 2 == 3). We want to write
# a function that will return the larger of these two differences.

# Phase 1: Naive Solution
# One approach to solving this problem would be:

# Initialize a local variable current_max_range to nil.
# Iterate over the array and consider each window of size w. 
# For each window:
#   Find the min value in the window.
#   Find the max value in the window.
# Calculate max - min and compare it to current_max_range. 
# Reset the value of current_max_range if necessary.
# Return current_max_range.
# Implement this approach in a method, windowed_max_range(array, window_size).
# Make sure your code passes the following test cases:
  # windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  # windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  # windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  # windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
# Think about the time complexity of your method. How many iterations are 
# required at each step? What is its overall time complexity in Big-O notation?

# Analysis
# the min and max calculation for every window costs
# O(n), thus, the time complexity of the function is
# O(n^2)
# The array slicing also costs O(n)
# In the space complexity we are creating new array
# every time.
def windowed_max_range(array, window_size)
  # debugger
  current_max_range = -1
  range = (array.length + 1) - window_size
  i = 0
  while i < range
    window = array[i...window_size+i]
    diff = window.max - window.min
    current_max_range = diff if diff > current_max_range
    i += 1
  end
  current_max_range
end

# puts windowed_max_range([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
# puts windowed_max_range([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
# puts windowed_max_range([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
# puts windowed_max_range([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8


# Optimized Solution:
# We will be creating a sequence of data structures that will
# culminate in a MinMaxStackQueue, our custom data structure 
# that will keep track of the min and max in constant time. 
# We will get to the specifics of how it does this in a second.

# We will be building the following in order:

# MyQueue
# MyStack
# StackQueue
# MinMaxStack
# MinMaxStackQueue

class MyQueue

  def initialize
    @queue = []
  end

  def enqueue(val)
    @queue << val
  end

  def dequeue
    @queue.shift
  end

  def size
    @queue.length
  end
  
  def empty?
    @queue.empty?
  end

  def peek
    @queue.first
  end

end

class MyStack

  def initialize
    @stack = []
  end

  def peek
    @stack.last
  end

  def size
    @stack.length
  end

  def empty?
    @stack.empty?
  end

  def pop
    @stack.pop
  end

  def push(val)
    @stack << val
  end

end

class StackQueue

  def initialize
    @enqueue_stack = MyStack.new
    @dequeue_stack = MyStack.new
  end

  def size
    @dequeue_stack.size + @enqueue_stack.size
  end

  def empty?
    @dequeue_stack.empty? && @enqueue_stack.empty?
  end

  def enqueue(val)
    @enqueue_stack.push(val)
  end

  # since the dequeue stack is built when the dequeue stack is only
  # empty the average time complexity will be O(1) for StackQueue
  def dequeue
    return nil if self.empty?
    return @dequeue_stack.pop if !@dequeue_stack.empty?
    until @enqueue_stack.empty?
      @dequeue_stack.push(@enqueue_stack.pop)
    end
    @dequeue_stack.pop
  end
  
end

# Phase 5: MinMaxStack

# Before we move on, let's take a step back to our MyStack class.
# We'll modify it so that we always know the maximum value in the
# stack. We could write a max method that calls @store.max. However,
# this requires us to iterate over every item in the @store array, 
# which gives us a time complexity of O(n). This isn't good enough 
# for us; we want to be able to return the max in constant time (O(1)).
# If we can't iterate over @store, how else could we modify the stack
# to get this functionality?

# Once you have max implemented, it should be easy to add a min method.

# Hint: We could store some metadata with the value of each element. 
# In other words, we can be storing more information than just the value
# with new element to the store. Think about how to do this and what 
# information to store.

# Implement peek, size, empty?, max, min, pop, push methods on your MinMaxStack.

class MinMaxStack
  
  def initialize
    @stack = []
    @max_min_meta = []
  end

  def peek
    @stack.last
  end

  def size
    @stack.length
  end

  def empty?
    @stack.empty?
  end

  def max
    @max_min_meta.last
  end

  def min
    @max_min_meta.first
  end

  def pop
    val = @stack.pop
    # if val == self.min
    #   @max_min_meta.delete_at(0)
    # elsif val == self.max
    #   @max_min_meta.delete_at(-1)
    # end
    @max_min_meta.delete(val)
    val
  end

  def push(val)
    if @max_min_meta.empty?
      @max_min_meta << val
    else
      (0...@max_min_meta.length).each do |idx|
        if @max_min_meta[idx] >= val
          @max_min_meta = @max_min_meta[0...idx] + [val] + @max_min_meta[idx..-1]
          break
        end
        if @max_min_meta[idx] == @max_min_meta.last
          @max_min_meta << val
        end
      end
    end
    @stack << val
  end

end

# Phase 6: MinMaxStackQueue
# Similar to MyStack (phase 3) was used to build StackQueue (phase 4)
# , use your MinMaxStack (phase 5) to build a MinMaxStackQueue.

# What methods are needed to solve this problem in O(n) time?

class MinMaxStackQueue

  def initialize
    @enqueue_stack = MinMaxStack.new
    @dequeue_stack = MinMaxStack.new
  end

  def size
    @dequeue_stack.size + @enqueue_stack.size
  end

  def empty?
    @dequeue_stack.empty? && @enqueue_stack.empty?
  end

  def min
    return nil if @enqueue_stack.min.nil? && @dequeue_stack.min.nil?
    if @enqueue_stack.min.nil? && !@dequeue_stack.min.nil?
      return @dequeue_stack.min
    elsif @dequeue_stack.min.nil? && !@enqueue_stack.min.nil?
      return @enqueue_stack.min
    else
      if @dequeue_stack.min < @enqueue_stack.min
        return @dequeue_stack.min
      end
      return @enqueue_stack.min
    end
  end

  def max
    return nil if @enqueue_stack.max.nil? && @dequeue_stack.max.nil?
    if @enqueue_stack.max.nil? && !@dequeue_stack.max.nil?
      return @dequeue_stack.max
    elsif @dequeue_stack.max.nil? && !@enqueue_stack.max.nil?
      return @enqueue_stack.max
    else
      if @dequeue_stack.max > @enqueue_stack.max
        return @dequeue_stack.max
      end
      return @enqueue_stack.max
    end
  end

  def enqueue(val)
    @enqueue_stack.push(val)
  end

  # since the dequeue stack is built when the dequeue stack is only
  # empty the average time complexity will be O(1) for StackQueue
  def dequeue
    return nil if self.empty?
    return @dequeue_stack.pop if !@dequeue_stack.empty?
    until @enqueue_stack.empty?
      @dequeue_stack.push(@enqueue_stack.pop)
    end
    @dequeue_stack.pop
  end

end

# Phase 7: Max Windowed Range
# Armed with a working MinMaxStackQueue, this problem should be much 
# easier. You'll want to follow the same basic approach as above, but 
# use our new data structure instead of array slices. As before, return 
# the current_max_range at the end of the method. Make sure all the test 
# cases pass, and that you both understand the time complexity of this solution.

def windowed_max_range_queue(array, window_size)
  # debugger
  mq = MinMaxStackQueue.new
  (0...array.length).each { |i| mq.enqueue(array[i]) }
  
  window = MinMaxStackQueue.new
  (0...window_size).each { |i| window.enqueue(mq.dequeue) }
  diff = window.max - window.min
  current_max = diff 
  until mq.empty?
    
    window.dequeue
    window.enqueue(mq.dequeue)
    diff = window.max - window.min
    current_max = diff if diff > current_max
  end
  current_max
end

puts windowed_max_range_queue([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
puts windowed_max_range_queue([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
puts windowed_max_range_queue([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
puts windowed_max_range_queue([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8
