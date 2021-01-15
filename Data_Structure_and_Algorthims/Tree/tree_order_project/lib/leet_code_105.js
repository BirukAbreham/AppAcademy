// View the full problem and run the test cases at:
//  https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

const { TreeNode } = require("./tree_node.js");

function buildTree(preorder, inorder) {
  let root = null;

  if (!preorder.length || !inorder.length) return null;

  if (preorder.length === 1) {
    root = new TreeNode(preorder[0]);
    return root;
  }

  let subRoot = preorder.shift();
  let subIdx = -1;
  inorder.forEach((val, idx) => {
    if (val === subRoot) subIdx = idx;
  });

  let inLeft = inorder.slice(0, subIdx);
  let inRight = inorder.slice(subIdx + 1);
  let preLeft = preorder.slice(0, inLeft.length);
  let preRight = preorder.slice(inLeft.length);

  root = new TreeNode(subRoot);
  root.left = buildTree(preLeft, inLeft);
  root.right = buildTree(preRight, inRight);

  return root;
}

module.exports = {
  buildTree,
};
