function maxValue(node) {
  let maxVal = -Infinity;
  let visited = new Set();

  let queue = [node];
  while (queue.length) {
    let start = queue.shift();
    visited.add(start);
    if (maxVal < start.val) {
      maxVal = start.val;
    }

    start.neighbors.forEach((neighbor) => {
      if (!visited.has(neighbor)) {
        queue.push(neighbor);
      }
    });
  }

  return maxVal;
}

module.exports = {
  maxValue,
};
