def average(num_1, num_2)
  return (num_1 + num_2) / 2.0
end

def average_array(array)
  return array.sum / (array.length).to_f
end

def repeat(str, num)
  return str*num
end

def yell(str)
  return str.upcase+"!"
end

def alternating_case(sentence)
  sent_arr = sentence.split(" ")
  sent_arr.each_with_index do |word, idx|
    if idx.even?
        sent_arr[idx] = word.upcase
    else
        sent_arr[idx] = word.downcase
    end
  end
  return sent_arr.join(" ")
end
