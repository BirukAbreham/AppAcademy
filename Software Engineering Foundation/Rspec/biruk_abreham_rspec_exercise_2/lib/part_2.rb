def palindrome?(str)
  reverse = ""
  str_arr = str.split("")
  str_arr.reverse_each { |el| reverse += el }
  if reverse == str
    return true
  end
  return false
end

def substrings(str)
  all_substrings = []

  str.each_char.with_index do |char, i|
    j = i
    while j < str.length
      if !all_substrings[-1] || j == i
        all_substrings << char
      else
        all_substrings << all_substrings[-1]+str[j]
      end
      j += 1
    end 
  end

  return all_substrings
end

def substrings_solution(str)
  all_substrings = []
  
  (0...str.length).each do |start_idx|
    (start_idx...str.length).each do |end_idx|
      all_substrings << str[start_idx..end_idx]
    end
  end

  return all_substrings
end

def palindrome_substrings(str)
  all_substrings = substrings(str)
  return all_substrings.select { |substr| palindrome?(substr) && (substr.length > 1) }
end
