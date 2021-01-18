function breadthFirstSearch(startingNode, targetVal) {
  let searchVal = null;
  let visited = new Set();

  let queue = [startingNode];
  while (queue.length) {
    let node = queue.shift();
    visited.add(node);
    if (node.val === targetVal) {
      searchVal = node;
      return searchVal;
    }

    node.neighbors.forEach((neighbor) => {
      if (!visited.has(neighbor)) {
        queue.push(neighbor);
      }
    });
  }

  return searchVal;
}

module.exports = {
  breadthFirstSearch,
};
