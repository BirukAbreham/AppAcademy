class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs
  
  def self.valid_pegs?(char_arr)
    pegs_arr = POSSIBLE_PEGS.keys

    char_arr.each do |color_char|
      if !pegs_arr.include?(color_char.upcase)
        return false
      end
    end

    return true
  end

  def initialize(char_arr)
    if !Code.valid_pegs?(char_arr)
      raise "Pegs of chars is not valid"
    end

    @pegs = char_arr.map(&:upcase)
  end
  
  def self.random(len)
    char_arr = []
    possible_pegs = POSSIBLE_PEGS.keys

    (0...len).each do |i|
      char_arr << possible_pegs.sample
    end
    
    return Code.new(char_arr)
  end
  
  def self.from_string(pegs_str)
    char_arr = pegs_str.split("")

    return Code.new(char_arr)
  end

  def [](idx)
    return @pegs[idx]
  end

  def length
    return @pegs.length
  end
  
  def num_exact_matches(code_inst)
    exact_count = 0
    
    @pegs.each_with_index do |color, idx|
      if color == code_inst[idx]
        exact_count += 1
      end
    end

    return exact_count
  end

  def num_near_matches(code_inst)
    near_count = 0

    @pegs.each_with_index do |color, idx|
      if @pegs.include?(code_inst[idx]) && color != code_inst[idx]
        near_count += 1
      end
    end

    return near_count
  end

  def ==(code_inst)
    return self.pegs == code_inst.pegs
  end

end
