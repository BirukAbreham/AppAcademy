function breadthFirstArray(root) {
  let list = [];
  let queue = [root];
  while (queue.length) {
    let node = queue.shift();
    list.push(node.val);
    if (node.left) queue.push(node.left);
    if (node.right) queue.push(node.right);
  }

  return list;
}

module.exports = {
  breadthFirstArray,
};
