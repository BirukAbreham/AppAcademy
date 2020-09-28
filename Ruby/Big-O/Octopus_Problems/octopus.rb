# Octopus Problems
#
# Big O-ctopus and Biggest Fish
# A versy hungry octopus wants to eat the longest fish
# in an array of fish
#

# Sluggish Octopus
# Find the longgest fish in O(n^2) time. Do this by comparing
# all fish lengths to all other fish lengths

def sluggish_octopus(fish)
  fish.each do |f|
    flag = true
    fish.each do |k|
      flag = false if f.length < k.length
    end
    return f if flag
  end
end

puts sluggish_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# Dominant Octopus
#
# Find the longest fish in O(n log n) time. Remember that 
# Big-O is classified by the dominant term.

def dominant_octopus(fish)
  big_fish = fish.sort { |a, b| b.length <=> a.length } # O(n log n)  // since sort uses quick sort algorithm
  big_fish[0]
end

puts dominant_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])


# Clever Octopus
#
# Find the longest fish in O(n) time. The octopus can hold
# on to the longest fish that you have found so far whle stepping
# through the array only once.

def clever_octopus(fish)
  # Only a single dominant loop which make the algorithm O (n)
  big_fish = fish[0]
  (1...fish.length).each do |idx|
    if big_fish.length < fish[idx].length
      big_fish = fish[idx]
    end
  end
  big_fish
end

puts clever_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# Dancing Octopus
