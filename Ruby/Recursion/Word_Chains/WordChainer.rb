
class WordChainer

  def initialize(dictionary_file)

    raise "File does not exits" if !File.exist?(dictionary_file)

    file = File.open(dictionary_file)
    line_arr = file.readlines
    line_arr.map! { |line| line.chomp }

    @dictionary = line_arr.to_set
    @current_words = []
    @all_seen_words = []

  end

  def adjacent_words(word)
    adj_words = []
    
    @dictionary.each_with_index do |val, i|
      if val.length == word.length
        flag = 0
        word.each_char.with_index do |char, i|
          flag += 1 if word[i] != val[i]
        end
        adj_words << val if flag == 1
      end
    end

    adj_words
  end

  def run(source, target)
    @current_words << source
    @all_seen_words << source
    until @current_words.empty?
      new_current_words = []
      @current_words.each do |word|
        self.adjacent_words(word).each do |adj|
          if !@all_seen_words.include?(adj)
            new_current_words << adj
            @all_seen_words << adj
          end
        end
      end
      p new_current_words
      @current_words = new_current_words
    end
  end

end
