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

module.exports = {
  treeHeight,
};
