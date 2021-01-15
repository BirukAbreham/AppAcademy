const { TreeNode } = require("./tree_node.js");

function inOrderArray(root, order = []) {
  if (!root) return order;

  inOrderArray(root.left, order);
  order.push(root.val);
  inOrderArray(root.right, order);

  return order;
}

function preOrderArray(root, order = []) {
  if (!root) return order;

  order.push(root.val);
  preOrderArray(root.left, order);
  preOrderArray(root.right, order);

  return order;
}

function postOrderArray(root, order = []) {
  if (!root) return order;

  postOrderArray(root.left, order);
  postOrderArray(root.right, order);
  order.push(root.val);

  return order;
}

module.exports = {
  inOrderArray,
  postOrderArray,
  preOrderArray,
};
