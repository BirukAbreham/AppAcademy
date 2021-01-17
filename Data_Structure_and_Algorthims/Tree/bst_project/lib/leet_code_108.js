// View the full problem and run the test cases at:
//  https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

const { TreeNode } = require("./bst");

// Given an array where elements are sorted in ascending order,
// convert it to a height balanced BST.

// For this problem, a height-balanced binary tree is defined
// as a binary tree in which the depth of the two subtrees of
// every node never differ by more than 1.

function sortedArrayToBST(nums) {
  if (!nums.length) return null;
  let midIdx = Math.floor(nums.length / 2);

  let root = new TreeNode(nums[midIdx]);
  root.left = sortedArrayToBST(nums.slice(0, midIdx));
  root.right = sortedArrayToBST(nums.slice(midIdx + 1));

  return root;
}

module.exports = {
  sortedArrayToBST,
};
