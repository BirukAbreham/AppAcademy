def duos(string)
    count = 0
    (0...string.length - 1).each do |i|
        count += 1 if string[i] == string[i + 1]
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0


def sentence_swap(sentence, h)
    words = sentence.split
    new_words = []
    words.each do |word|
        if h.has_key?(word)
            new_words << h[word]
        else
            new_words << word
        end
    end
    new_words.join(' ')
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'


def hash_mapped(hash, prc, &blk)
    new_hash = {}
    hash.each do |key, val|
        new_hash[blk.call(key)] = prc.call(val)
    end
    new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}


def counted_characters(string)
    count = Hash.new(0)
    string.each_char { |char| count[char] += 1 }
    count
        .select { |char, num| num > 2 }
        .keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []


def triplet_true?(string)
    (0...string.length - 2).each do |i|
        if string[i..i+2] == string[i] * 3
            return true
        end
    end

    false
end

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false


def energetic_encoding(string, h)
    new_string = ''
    string.each_char do |char|
        if char == ' '
            new_string += ' '
        elsif h.has_key?(char)
            new_string += h[char]
        else
            new_string += '?'
        end
    end
    new_string
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
    uncompressed = ''
    (0...str.length - 1).each do |i|
        letter = str[i]
        num = str[i + 1].to_i
        uncompressed += letter * num
    end
    uncompressed
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(array, *prcs)
    array.select { |el| prcs.all? { |prc| prc.call(el) } }
end

def conjunct_select(array, *prcs)
    prcs.inject(array) { |acc, prc| acc.select(&prc) }
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]


def convert_pig_latin(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        new_word = word.length > 2 ? convert_word(word) : word
        word == word.capitalize ? new_word.capitalize : new_word
    end
    new_words.join(' ')
end

def convert_word(word)
    vowels = 'AEIOUaeiou'
    return word + 'yay' if vowels.include?(word[0])
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[i..-1] + word[0...i] + 'ay'
        end
    end
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"


def reverberate(sentence)
    words = sentence.split
    new_words = words.map do |word|
        new_word = word.length > 2 ? translate_word(word) : word
        new_word = word == word.capitalize ? new_word.capitalize : new_word
    end
    new_words.join(' ')
end

def translate_word(word)
    vowels = 'AEIOUaeiou'
    return word + word if vowels.include?(word[-1])
    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word + word[i..-1]
        end
        i -= 1
    end
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"


def disjunct_select(array, *prcs)
    array.select { |el| prcs.any? { |prc| prc.call(el) } }
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
    words = sentence.split(' ')
    new_words = words.map.with_index do |word, i|
        i.even? ? remove_first_vowel(word) : remove_last_vowel(word)
    end
    new_words.join(' ')
end

def remove_first_vowel(word)
    vowels = 'AEIOUaeiou'
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[0...i] + word[i + 1..-1]
        end
    end
    word
end

def remove_last_vowel(word)
    remove_first_vowel(word.reverse).reverse
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


def silly_talk(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        new_word = transcribe_word(word)
        word == word.capitalize ? new_word.capitalize : new_word
    end
    new_words.join(' ')
end

def transcribe_word(word)
    vowels = 'AEIOUaeiou'
    return word + word[-1] if vowels.include?(word[-1])
    new_word = ''
    word.each_char do |char|
        if vowels.include?(char)
            new_word += char + 'b' + char
        else
            new_word += char
        end
    end
    return new_word
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


def compress(string)
    compressed = ''
    letters = ('a'..'z').to_a
    i = 0
    while i < string.length
        char = string[i]
        count = 1
        i += 1
        while char == string[i]
            count += 1
            i += 1
        end

        if count > 1
            compressed += char + count.to_s
        else
            compressed += char
        end
    end

    compressed
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"
