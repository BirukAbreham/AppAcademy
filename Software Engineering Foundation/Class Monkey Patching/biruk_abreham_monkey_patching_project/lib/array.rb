# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length == 0
        return nil
    end

    new_arr = self.sort
    return new_arr[-1] - new_arr[0]
  end

  def average
    if self.length == 0
        return nil
    end

    return self.sum / (self.length).to_f
  end

  def median
    if self.length == 0
        return nil
    end

    new_arr = self.sort

    if new_arr.length.even?
      mid_even = (new_arr.length / 2) - 1
      return (new_arr[mid_even] + new_arr[mid_even + 1]) / 2.0
    else
      mid_odd = new_arr.length / 2
      return new_arr[mid_odd]
    end
  end

  def counts
    hash = Hash.new(0)
    self.each { |el| hash[el] += 1 }
    return hash
  end

  def my_count(val)
    val_count = 0

    self.each do |el|
      if val == el
        val_count += 1
      end
    end
    
    return val_count
  end

  def my_index(val)
    val_index = nil
    
    self.each_with_index do |el, i|
      if val == el
        if val_index == nil
          val_index = i
        end
      end  
    end

    return val_index
  end

  def my_uniq
    new_arr = []

    self.each do |el|
      if !new_arr.include?(el)
        new_arr << el
      end
    end

    return new_arr
  end

  def my_transpose
    new_arr = []

    (0...self.length).each { |l| new_arr << [] }

    self.each_with_index do |el_1, i|
      self.each_with_index do |el_2, j|
        new_arr[i][j], new_arr[j][i] = self[j][i], self[i][j]
      end
    end

    return new_arr
  end
end
