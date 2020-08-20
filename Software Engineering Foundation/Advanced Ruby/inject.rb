# inject , the accumulator is the first value of arr
arr = [11, 7, 2, 4]
arr_inject = arr.inject { |acc, el| acc + el }
p arr_inject

# inject with a default accumulator 

arr_default_inject = arr.inject(100) { |acc, el| acc + el }
p arr_default_inject