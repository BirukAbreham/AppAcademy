def element_count(arr)
  count = Hash.new(0)

  arr.each { |ele| count[ele] += 1 }

  return count
end

def char_replace!(str, hash)
  str.each_char.with_index do |char, idx|
    str[idx] = hash[char] if hash.has_key?(char)
  end
  return str
end

def product_inject(arr_num)
 return arr_num.inject(1) { |product, num| product*num }
end
