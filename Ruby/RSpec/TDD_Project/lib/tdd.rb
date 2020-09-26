class Array

  def my_uniq
    uniq = []
    self.each do |a|
      uniq << a if !uniq.include?(a)
    end
    uniq
  end

  def two_sum
    sum = []
    (0...self.length).each do |idx1|
      (idx1+1...self.length).each do |idx2|
        sum << [ idx1, idx2 ] if (self[idx1] + self[idx2]) == 0
      end
    end
    sum
  end

  def my_transpose
    new_arr = []
    (0...self.length).each { |l| new_arr << [] }
    self.each_with_index do |el_1, i|
      self.each_with_index do |el_2, j|
        new_arr[i][j], new_arr[j][i] = self[j][i], self[i][j]
      end
    end
    new_arr
  end

end

def stock_picker(stock_price)
  max_val = stock_price.max
  max_val_day = stock_price.index(max_val)
  min_val = stock_price[0...max_val].min
  min_val_day = stock_price.index(min_val)
  [ min_val_day, max_val_day ]
end
