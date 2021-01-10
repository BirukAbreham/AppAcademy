function binarySearch(array, target) {
  if (array.length === 0) return false;

  let midIdx = Math.floor(array.length / 2);
  let leftHalf = array.slice(0, midIdx);
  let rightHalf = array.slice(midIdx + 1);

  if (target < array[midIdx]) {
    return binarySearch(leftHalf, target);
  } else if (target > array[midIdx]) {
    return binarySearch(rightHalf, target);
  } else {
    return true;
  }
}

// The array that we consider goes from array.slice(low, high + 1)
// The main point is to consider change half the array on each recursive
// call by the low and high points
function binarySearchIndex(array, target, low = 0, high = array.length - 1) {
  if (low === high) return -1;

  let midIdx = Math.floor((low + high) / 2);

  if (target < array[midIdx]) {
    return binarySearchIndex(array, target, low, (high = midIdx));
  } else if (target > array[midIdx]) {
    return binarySearchIndex(array, target, (low = midIdx + 1), high);
  } else {
    return midIdx;
  }
}

module.exports = {
  binarySearch,
  binarySearchIndex,
};
