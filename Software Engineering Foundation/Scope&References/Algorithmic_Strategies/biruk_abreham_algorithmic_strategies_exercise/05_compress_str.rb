# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  comp_str = ""
  (0..str.length - 1).each do |i|
    if str[i + 1] != nil
      if str[i] == str[i+1]
        if comp_str[-1] == str[i]
          # add one on the existing
          val = comp_str[-2].to_i + 1
          comp_str[-2] = val.to_s
        else
          comp_str += "2"+str[i]
        end
      else
        if comp_str[-1] != str[i]
          comp_str += str[i]
        end
      end
    else
      if comp_str[-1] != str[i]
        comp_str += str[i]
      end
    end
  end
  return comp_str
end

def compress_str_solution(str)
  compressed = ""
  
  i = 0
  while i < str.length
    char = str[i]
    count = 0
    while char == str[i]
      count += 1
      i += 1
    end

    if count > 1
      compressed += (count.to_s + char)
    else
      compressed += char
    end
  end
  
  return compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"

