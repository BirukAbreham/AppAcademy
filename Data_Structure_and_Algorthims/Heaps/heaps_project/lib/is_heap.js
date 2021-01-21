// you may assume that the array will always have a null element at the 0-th index
function isMaxHeap(array, idx = 1) {
  // empty heap
  if (array.length === 1) return true;

  let isHeap = true;

  for (let idx = 0; idx < array.length; idx++) {
    if (idx === 0) continue;
    let leftVal = array[idx * 2] ? array[idx * 2] : -Infinity;
    let rightVal = array[idx * 2 + 1] ? array[idx * 2 + 1] : -Infinity;

    if (array[idx] < leftVal || array[idx] < rightVal) {
      isHeap = false;
      break;
    }
  }

  return isHeap;
}

function isMaxHeapRec(array, idx = 1) {
  // base case
  if (array[idx] === undefined) return true;

  let leftIdx = idx * 2;
  let rightIdx = idx * 2 + 1;
  let leftVal = array[leftIdx] === undefined ? -Infinity : array[leftIdx];
  let rightVal = array[rightIdx] === undefined ? -Infinity : array[rightIdx];

  return (
    array[idx] > leftVal &&
    array[idx] > rightVal &&
    isMaxHeapRec(array, leftIdx) &&
    isMaxHeapRec(array, rightIdx)
  );
}
module.exports = {
  isMaxHeap,
  isMaxHeapRec,
};
