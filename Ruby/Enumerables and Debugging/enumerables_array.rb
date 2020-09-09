class Array
  
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    selects = []
    self.my_each do |item|
      selects << item if prc.call(item)
    end
    selects
  end

  def my_reject(&prc)
    rej = []
    self.my_each do |item|
      rej << item if !prc.call(item)
    end
    rej
  end

  def my_any?(&prc)
    self.my_each do |item|
      return true if prc.call(item)
    end
    false
  end

  def my_flatten(data=self)
    return [data] if !data.is_a?(Array)
  
    flattened = []
    data.each do |el|
      flattened += self.my_flatten(el)
    end
    
    flattened
  end

  def my_zip(*args)
    zip = []
    i = 0
    while i < self.length
      zip << [self[i]]
      args.my_each do |arr|
        zip[i] << arr[i]
      end
      i += 1
    end
    zip
  end

  def my_rotate(amount=1)
    x = amount%self.length
    [ *self[x..-1], *self[0...x] ]
  end

  def my_join(separator="")
    str = ""
    self.my_each do |item|
      if self.index(item) != self.length-1
        str += item.to_s + separator
      else
        str += item.to_s
      end
    end
    str
  end

  def my_reverse
    reversed = []
    i = self.length-1
    while i >= 0
      reversed << self[i]
      i -= 1
    end
    reversed
  end

end
