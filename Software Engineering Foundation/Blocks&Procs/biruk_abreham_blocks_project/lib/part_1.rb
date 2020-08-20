def select_even_nums(arr)
  return arr.select(&:even?)
end

def reject_puppies(arr_hash)
  return arr_hash.reject { |ele| ele["age"] <= 2 }
end

def count_positive_subarrays(arr)
  return arr.count { |subarr| subarr.sum > 0}
end

def aba_translate(word)
  new_word = ""

  word.each_char.with_index do |char, i|
    if "aeiou".include?(char)
      new_word += char+"b" +char
    else
      new_word += char
    end
  end

  return new_word
end

def aba_array(words)
  return words.map { |word| aba_translate(word) }
end
