class Map

  def initialize
    @map = []
  end

  def set(key, value)
    # either create a new key-value pair or update the
    # value for a pre-existing key
    if @map.flatten.include?(key)
      @map.each_with_index do |pair, idx|
        if pair[0] == key
          @map[idx] = [key, value]
        end
      end
    else
      @map << [key, value]
    end
  end

  def get(key)
    @map.each do |pair|
      return pair if pair[0] == key
    end
    nil
  end

  def delete(key)
    @map.each do |pair|
      if pair[0] == key
        return @map.delete(pair)
      end
    end
    nil
  end

  def show
    p @map
  end

end

map = Map.new
map.set(1, "one")
map.set(2, "two")
map.set(3, "three")
map.set(4, "four")
map.set(5, "five")

map.show # [[1, "one"], [2, "two"], [3, "three"], [4, "four"], [5, "five"]]

p map.get(1)  # one
p map.get(2)  # two
p map.get(10) # nil

p map.delete(1)   # [1, "one"]
p map.delete(2)   # [2, "two"]
p map.delete(10)  # nil

map.show # [[3, "three"], [4, "four"], [5, "five"]]
