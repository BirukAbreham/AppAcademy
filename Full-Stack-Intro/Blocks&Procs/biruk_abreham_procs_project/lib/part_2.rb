def reverser(str, &prc)
  new_str = ""
  
  str.each_char do |char|
    new_str = char + new_str
  end

  return prc.call(new_str)
end

def word_changer(sentence, &prc)
  words = sentence.split(" ")
  words.map! { |word| prc.call(word) }
  return words.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  prc_1_val = prc_1.call(num)
  prc_2_val = prc_2.call(num)
  if prc_1_val > prc_2_val
    return prc_1_val
  else
    return prc_2_val
  end
end

def and_selector(arr, prc_1, prc_2)
  return arr.select { |val| prc_1.call(val) && prc_2.call(val) }
end

def alternating_mapper(arr, prc_1, prc_2)
  new_arr = []

  arr.each_with_index do |val, i|
    if i.even?
        new_arr << prc_1.call(val)
    else
        new_arr << prc_2.call(val)
    end
  end

  return new_arr
end
