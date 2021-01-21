// https://leetcode.com/problems/kth-largest-element-in-an-array/

// Find the kth largest element in an unsorted array.
// Note that it is the kth largest element in the sorted
// order, not the kth distinct element.

// Example 1:
// Input: [3, 2, 1, 5, 6, 4] and k = 2
// Output: 5

// Example 2:
// Input: [3, 2, 3, 1, 2, 4, 5, 5, 6] and k = 4
// Output: 4

// Note:
// You may assume k is always valid, 1 ≤ k ≤ array's length.

class MaxHeap {
  constructor() {
    this.array = [null];
  }

  getParent(idx) {
    return Math.floor(idx / 2);
  }

  getLeftChild(idx) {
    return idx * 2;
  }

  getRightChild(idx) {
    return idx * 2 + 1;
  }

  siftUp(idx) {
    // base case -- only a root
    if (idx === 1) return;

    let parentIdx = this.getParent(idx);
    if (this.array[idx] > this.array[parentIdx]) {
      [this.array[idx], this.array[parentIdx]] = [
        this.array[parentIdx],
        this.array[idx],
      ];
      this.siftUp(parentIdx);
    }
  }

  insert(val) {
    this.array.push(val);
    this.siftUp(this.array.length - 1);
  }

  siftDown(idx) {
    let leftIdx = this.getLeftChild(idx);
    let rightIdx = this.getRightChild(idx);
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
    if (leftVal > rightVal) {
      swapIdx = leftIdx;
    } else {
      swapIdx = rightIdx;
    }
    [ary[swapIdx], ary[idx]] = [ary[idx], ary[swapIdx]];
    this.siftDown(swapIdx);
  }

  deleteMax() {
    // empty heap
    if (this.array.length === 1) return null;

    // only one node heap
    if (this.array.length === 2) return this.array.pop();

    let max = this.array[1];

    // making the right most node to the top of the tree (root)
    this.array[1] = this.array.pop();
    this.siftDown(1);

    return max;
  }
}

// This solution runs O(n) because array to heap only takes O(n)
function findKthLargest(nums, k) {
  let maxHeap = new MaxHeap();

  nums.forEach((val) => {
    maxHeap.insert(val);
  });

  let kthLargest = null;
  while (k > 0) {
    kthLargest = maxHeap.deleteMax();
    k--;
  }

  return kthLargest;
}

// This solution runs O(nlog(n)) because of the sorting on line 114
function findKthLargestSln(nums, k) {
  let sorted = nums.sorted((a, b) => a - b);
  return sorted[nums.length - k];
}

module.exports = {
  findKthLargest,
  findKthLargestSln,
};
