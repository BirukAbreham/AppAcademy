// View the full problem and run the test cases at:
//  https://leetcode.com/problems/balanced-binary-tree/

function isBalanced(root) {
  if (!root) return true;

  return (
    Math.abs(treeHeight(root.left) - treeHeight(root.right)) <= 1 &&
    isBalanced(root.left) &&
    isBalanced(root.right)
  );
}

function treeHeight(root) {
  let height = -1;
  if (!root) return height;

  let queue = [root];
  while (queue.length) {
    let node = queue.shift();

    if (height === -1) height = 0;
    if (node.left || node.right) height += 1;

    if (node.left) queue.push(node.left);
    if (node.right) queue.push(node.right);
  }

  return height;
}

function getHeight(root) {
  if (!root) return -1;
  return 1 + Math.max(getHeight(root.left), getHeight(root.right));
}

function isBalancedSln(root) {
  if (!root) return true;

  return (
    Math.abs(getHeight(root.left) - getHeight(root.right)) <= 1 &&
    isBalancedSln(root.left) &&
    isBalancedSln(root.right)
  );
}

module.exports = {
  isBalanced,
  isBalancedSln,
};
