class MaxHeap {
  constructor() {
    this.array = [null];
  }

  insert(val) {
    this.array.push(val);
    this.siftUp(this.array.length - 1);
  }

  siftUp(idx) {
    // base case -- only a root
    if (idx === 1) return;

    let parentIdx = Math.floor(idx / 2);
    if (this.array[idx] > this.array[parentIdx]) {
      [this.array[idx], this.array[parentIdx]] = [
        this.array[parentIdx],
        this.array[idx],
      ];
      this.siftUp(parentIdx);
    }
  }

  deleteMax() {
    let max = this.array[1];

    // making the right most node to the top of the tree (root)
    this.array[1] = this.array.pop();
    this.siftDown(1);

    return max;
  }

  siftDown(idx) {
    let leftIdx = idx * 2;
    let rightIdx = idx * 2 + 1;
    let ary = this.array;
    let leftVal = ary[leftIdx];
    let rightVal = ary[rightIdx];
    let val = ary[idx];

    if (leftVal === undefined) leftVal = -Infinity;
    if (rightVal === undefined) rightVal = -Infinity;

    // base case
    if (val > leftVal && val > rightVal) return;

    // to swap compare left and right children
    let swapIdx;
    leftVal > rightVal ? (swapIdx = leftIdx) : (swapIdx = rightIdx);
    [ary[swapIdx], ary[idx]] = [ary[idx], ary[swapIdx]];
    this.siftDown(swapIdx);
  }
}
