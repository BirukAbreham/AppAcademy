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

function breadthFirstSearchSln(startingNode, targetVal) {
  let queue = [startingNode];
  let visited = new Set();

  while (queue.length) {
    let node = queue.shift();
    if (visited.has(node)) continue;
    visited.add(node);

    if (node.val === targetVal) return node;
    queue.push(...node.neighbors);
  }

  return null;
}

module.exports = {
  breadthFirstSearch,
};
