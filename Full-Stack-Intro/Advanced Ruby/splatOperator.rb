# using splat to accept additional arguments
def method(arg1, arg2, *other_args)
  p arg1
  p arg2
  p other_args
end

method("a", "b", "c", "d", "e")

# using splat to decompose an array
def greet(first_name, last_name)
  p "Hey "+ first_name +", your last name is "+last_name
end

names = ["Biruk", "Abreham"]
greet(*names)

# using splat to decompose a hash
old_hash = { a: 1, b: 2 }
new_hash = { **old_hash, c: 3 }
p new_hash # => {:a=>1, :b=>2, :c=>3}