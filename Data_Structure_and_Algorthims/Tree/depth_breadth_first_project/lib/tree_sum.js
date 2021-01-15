function treeSum(root) {
  let sum = 0;
  if (!root) return sum;

  let stack = [root];
  while (stack.length) {
    let node = stack.pop();
    sum += node.val;
    if (node.right) stack.push(node.right);
    if (node.left) stack.push(node.left);
  }

  return sum;
}

module.exports = {
  treeSum,
};
