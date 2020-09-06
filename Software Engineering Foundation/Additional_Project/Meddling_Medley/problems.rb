# Phase 1: Modest problems

def duos(str)
  same_count = 0
  (0...str.length-1).each do |i|
    same_count += 1 if str[i] == str[i+1]
  end
  same_count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sentence, hash)
  new_words = []
  words = sentence.split
  words.each do |word|
    if hash.has_key?(word)
      new_words << hash[word]
    else
      new_words << word
    end
  end

  return new_words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#   'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#   'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#   'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc, &block)
  new_hash = {}

  hash.each do |key, val|
    new_hash[block.call(key)] = prc.call(val)
  end

  return new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
  twice_or_more = Hash.new(0)
  str.each_char { |char| twice_or_more[char] += 1 }
  return twice_or_more.select { |key, val| val > 2 }.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
  (0...str.length-2).each do |i|
    return true if str[i] == str[i+1] && str[i+1] == str[i+2]
  end
  return false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
  str.each_char.with_index do |char, i|
    if hash.has_key?(char) && char != " "
      str[i] = hash[char]
    elsif char != " "
      str[i] = "?"
    end
  end
  return str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
  new_str = ""
  i = 0
  while i < str.length-1
    new_str += str[i]*(str[i+1].to_i)
    i += 1
  end
  return new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# Phase 2: More difficult, maybe?

def conjunct_select(arr, *prcs)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if prcs.all? { |prc| prc.call(ele) }
  end
  new_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
  new_words = []
  sentence.split.each do |word|
    if word.length < 3
      new_words << word
    else
      if "AEIOUaeiou".include?(word[0])
        new_words << word+"yay"
      else
        first_vowel_index = nil
        word.each_char.with_index do |char, i|
          if "AEIOUaeiou".include?(char)
            first_vowel_index = i
            break
          end
        end
        if word[0].upcase == word[0]
          new_word = word[first_vowel_index..-1]+word[0...first_vowel_index]+"ay"
          new_words << new_word[0].upcase + new_word[1..-1].downcase
        else
          new_words << word[first_vowel_index..-1]+word[0...first_vowel_index]+"ay"
        end
      end
    end
  end
  new_words.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sentence)
  new_words = []
  sentence.split.each do |word|
    if word.length < 3
      new_words << word
    else
      if "AEIOUaeiou".include?(word[-1])
        if word[0].upcase == word[0]
          new_word = word.downcase*2
          new_words << new_word[0].upcase + new_word[1..-1]
        else
          new_words << word*2
        end
      else
        last_v_index = nil
        i = -1
        while i > -(word.length+1)
          if "AEIOUaeiou".include?(word[i])
            last_v_index = i
            break
          end
          i -= 1
        end
        new_words << word[0...last_v_index] + word[last_v_index..-1] + + word[last_v_index..-1]
      end
    end
  end
  new_words.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if prcs.any? { |prc| prc.call(ele) }
  end
  new_arr
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sentence)
  new_sent = []
  sentence.split.each_with_index do |word, idx|
    if idx.even?
      word.each_char.with_index do |char, i|
        if "aeiou".include?(char)
          word[i] = ""
          break
        end
      end
      new_sent << word
    else
      word.reverse!.each_char.with_index do |char, j|
        if "aeiou".include?(char)
          word[j] = ""
          break
        end
      end
      new_sent << word.reverse
    end
  end
  new_sent.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
  new_sent = []
  sentence.split.each do |word|
    if "aeiou".include?(word[-1])
      new_sent << word + word[-1]
    else
      new_word = ""
      word.each_char do |char|
        if "AEIOUaeiou".include?(char)
          if char.upcase == char
            new_word += char+"b"+char.downcase
          else
            new_word += char+"b"+char
          end
        else
          new_word += char
        end
      end
      new_sent << new_word
    end
  end
  new_sent.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

# require "byebug"

def compress(str)
  # debugger
  str_compressed = ""
  count = 0
  max_char = str[0]
  max_count = 0
  (0..str.length).each do |i|
    if str[i] != max_char
      if max_count == 1
        str_compressed += max_char
      else
        str_compressed += max_char + max_count.to_s
      end
      count = 1
      max_char = str[i]
      max_count = 1
    else
      count += 1
    end    

    if max_count < count
      max_count = count
    end
  end
  str_compressed
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
