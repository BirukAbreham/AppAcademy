def all_words_capitalized?(words)
  return words.all? { |word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase }
end

def no_valid_url?(urls)
  valid = [".com", ".net", ".io", ".org"]

  no_valid = urls.none? do |url|
    dot_index = url.index(".")
    valid.include?(url[dot_index..-1])
  end

  return no_valid
end

def any_passing_students?(arr_hash)
  pass = arr_hash.any? do |hash|
    average(hash[:grades]) >= 75.0
  end
  
  return pass
end

def average(grades)
  return grades.sum / (grades.length * 1.0)
end
