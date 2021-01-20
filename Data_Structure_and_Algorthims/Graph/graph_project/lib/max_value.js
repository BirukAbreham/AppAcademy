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

function maxValueSln(node, visited = new Set()) {
  if (visited.has(node)) return -Infinity;
  visited.add(node);

  let neighborMaxes = node.neighbors.map((neighbor) =>
    maxValueSln(neighbor, visited)
  );
  return Math.max(...neighborMaxes, node.val);
}

module.exports = {
  maxValue,
  maxValueSln,
};
