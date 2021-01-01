Array.prototype.uniq = function () {
  let unique = []
  for(let val of this) {
    if (!unique.includes(val)) unique.push(val)
  }
  return unique
}

console.log([1, 2, 2, 3, 3, 3].uniq()) // [1, 2, 3]

Array.prototype.twoSum = function() {
  let pairSumZero = []
  for(let i = 0; i < this.length; i++) {
    
    for(let j = 0; j < i + 1; j++) {
     if (this[i] + this
    }
  }
  return pairSumZero
}
