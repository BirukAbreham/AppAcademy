def my_reject(arr, &prc)
  new_arr = []

  arr.each do |ele|
    new_arr << ele if !prc.call(ele)
  end

  return new_arr
end

def my_one?(arr, &prc)
  count = 0
  
  arr.each do |ele|
    count -= 1 if prc.call(ele)
  end
  
  return count == -1
end

def hash_select(hash, &prc)
  new_hash = {}

  hash.each do |k, v|
    new_hash[k] = v if prc.call(k, v)
  end

  return new_hash
end

def xor_select(arr, prc_1, prc_2)
  new_arr = []

  arr.each do |ele|
    if (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele))
      new_arr << ele
    end
  end

  return new_arr
end

def proc_count(val, arr)
  pass_count = 0

  arr.each do |prc|
    pass_count += 1 if prc.call(val)
  end

  return pass_count
end
