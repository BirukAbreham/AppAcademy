def my_map(arr, &prc)
  new_arr = []

  arr.each do |el|
    new_arr << prc.call(el)
  end

  return new_arr
end

def my_select(arr, &prc)
  new_arr = []

  arr.each do |el|
    if prc.call(el)
        new_arr << el
    end
  end

  return new_arr
end

def my_count(arr, &prc)
  count = 0

  arr.each do |el|
    if prc.call(el)
        count += 1
    end
  end

  return count
end

def my_any?(arr, &prc)

  arr.each do |el|
    if prc.call(el)
      return true
    end
  end

  return false

end

def my_all?(arr, &prc)
  
  arr.each do |el|
    if !prc.call(el)
        return false
    end
  end

  return true

end

def my_none?(arr, &prc)
  arr.each do |el|
    if prc.call(el)
        return false
    end
  end
  
  return true

end
