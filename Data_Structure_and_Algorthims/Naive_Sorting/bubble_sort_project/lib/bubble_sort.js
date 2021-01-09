function swap(array, idx1, idx2) {
  let temp = array[idx1];
  array[idx1] = array[idx2];
  array[idx2] = temp;

  return array;
}

function bubbleSort(array) {
  let swapped = true;

  while (swapped) {
    swapped = false;
    for (let i = 0; i < array.length - 1; i++) {
      if (array[i] > array[i + 1]) {
        swap(array, i, i + 1);
        swapped = true;
      }
    }
  }

  return array;
}

console.log(bubbleSort([2, -1, 4, 3, 7, 3]));

module.exports = {
  bubbleSort,
  swap,
};
