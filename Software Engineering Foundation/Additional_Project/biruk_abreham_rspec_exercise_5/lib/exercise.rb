def zip(*arr)
  return arr if arr.length == 1

  zip_arr = []

  arr.each do |suba|
    suba.each_with_index do |ele, idx|
      if zip_arr[idx].nil?
        zip_arr[idx] = [ele]
      else
        zip_arr[idx] << ele
      end
    end
  end

  return zip_arr
end

def zip_sln(*arrs)
  len = arrs.first.length

  (0...len).map do |i|
    arrs.map { |arr| arr[i] }
  end
end

def zany_zip(*arr)
  return arr if arr.length == 1

  zany_arr = []
  
  arr.each_with_index do |suba, idx_1|
    zany_arr[idx_1] = Array.new(arr.length, nil)
    suba.each_with_index do |ele, idx_2|
      zany_arr[idx_1][idx_2] = ele
    end
  end

  return zany_arr
end

def zany_zip_sln(*arrs)
  len = arrs.map(&:length).max

  (0...len).map do |i|
    arrs.map { |arr| arr[i] }
  end
end

def prizz_proc(arr, prc_1, prc_2)
  new_arr = []

  arr.each do |ele|
    if (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele))
      new_arr << ele
    end
  end

  return new_arr
end

def maximum(arr, &prc)
  return nil if arr.empty?
  
  max = arr[0]
  max_val = nil
  arr.each_with_index do |ele, idx|
    res = prc.call(ele)
    max_val = res if max_val.nil?
    if max_val < res
      max = arr[idx]
      max_val = res
    elsif max_val == res
      max = arr[idx]
      max_val = res
    end
  end

  return max
end

def maximum_sln(arr, &prc)
  return nil if arr.empty?

  max = arr.first
  array.each do |el|
    max = el if prc.call(el) >= prc.call(max)
  end

  return max
end

def my_group_by(arr, &prc)
  hash = Hash.new { |hash, k| hash[k] = [] }
  
  arr.each do |ele|
    res = prc.call(ele)
    hash[res] << ele
  end
  
  return hash
end

def max_tie_breaker(arr, prc_1, &prc_2)
  return nil if arr.empty?

  max = arr[0]
  max_val = nil
  arr.each_with_index do |ele, idx|
    res = prc_2.call(ele)
    max_val = res if max_val.nil?
    if max_val < res
      max = arr[idx]
      max_val = res
    elsif max_val == res
      res_2 = prc_1.call(ele)
      if max_val < res_2
        max = arr[idx]
        max_val = res_2
      end
    end
  end

  return max
end

def max_tie_breaker_sln(arr, tie_breaker, &prc)
  return nil if arr.empty?

  max = arr.first
  arr.each do |el|
    result_el = prc.call(el)
    result_max = prc.call(max)
    if result_el > result_max
      max = el
    elsif result_el == result_max && tie_breaker.call(el) > tie_breaker.call(max)
      max = el
    end
  end

  return max
end

def silly_syllables(sentence)
  new_sentence = []

  words = sentence.split(" ")
  words.each do |word|
    f_idx, l_idx = -1, -1
    new_word = ""
    word.each_char.with_index do |char, idx|
      if "aeiou".include?(char)
        if f_idx == -1
          f_idx = idx
        else
          l_idx = idx
        end
      end
    end

    if l_idx > -1
      new_word += word[f_idx..l_idx]
    else
      new_word += word
    end

    new_sentence << new_word
  end

  return new_sentence.join(" ")
end
