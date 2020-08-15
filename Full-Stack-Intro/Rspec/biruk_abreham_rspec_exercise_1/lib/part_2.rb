def hipsterfy(word)
  vowels = "aeiou"
  vowel_hash = {}
  word.each_char.with_index do |char, i|
    if vowels.include?(char)
        if !vowel_hash.has_key?(char)
            vowel_hash[char] = [i]
        else
            vowel_hash[char] = [vowel_hash[char][-1], i]
        end
    end
  end
  get_arr = vowel_hash.values.flatten
  if get_arr.length != 0
    get_max = get_arr.max
    word[get_max] = ""
  end
  return word
end

def vowel_counts(str)
  hash = Hash.new(0)
  vowels = "aeiou"
  str = str.downcase
  str.each_char do |char|
    if vowels.include?(char)
      hash[char] += 1
    end
  end
  return hash
end

def caesar_cipher(message, num)
  eng_letters = "abcdefghijklmnopqrstuvwxyz"
  message.each_char.with_index do |char, idx|
    if eng_letters.include?(char)
        getIndex = eng_letters.index(char)
        newIndex = (getIndex + num) % 26
        message[idx] = eng_letters[newIndex]
    end
  end
  return message
end