# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.


def max_inject(*arr)
  max_val = arr.inject do |max, el|
    if max < el
      el
    else
      max
    end
  end
  return max_val
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30
