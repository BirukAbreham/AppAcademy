def partition(arr, num)
    lesser_than = []
    greater_than = []
    arr.each do |el|
      if el >= num
        greater_than << el
      else
        lesser_than << el
      end
    end
    return [lesser_than, greater_than]
end

def merge(hash_1,hash_2)
  hash = {}
  hash_key_merge = hash_1.keys + hash_2.keys
  hash_key_merge.each do |key|
    if hash_1.has_key?(key) && hash_2.has_key?(key)
        hash[key] = hash_2[key]
    elsif hash_1.has_key?(key) && !hash_2.has_key?(key)
        hash[key] = hash_1[key]
    else
        hash[key] = hash_2[key]
    end
  end
  return hash
end

def merge_solution(hash_1, hash_2)
  new_hash = {}
  # because the second hash overrides any duplicate
  # key by the first hash there is no issue here
  hash_1.each { |k, v| new_hash[k] = v }
  hash_2.each { |k, v| new_hash[k] = v }
  return new_hash
end

def censor(sentence, arr)
  words = sentence.split

  words.each_with_index do |word, i|
    if arr.include?(word.downcase)
      words[i] = change_vowel_splat(word)
    end
  end
  
  return words.join(" ")
end

def change_vowel_splat(word)
  vowels = "aeiou"
  word.each_char.with_index do |char, i|
    if vowels.include?(char.downcase)
      word[i] = "*"
    end
  end
  
  return word
end

def power_of_two?(num)
  val = Math.log2(num)
  if val == 0.0
    return true
  end
  
  if val % val.to_i == 0
    return true
  else
    return false
  end
end
