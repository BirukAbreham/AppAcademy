function numRegions(graph) {
  let regions = 0;

  let visited = new Set();
  for (let node in graph) {
    regions += _numRegions(node, graph, visited);
  }

  return regions;
}

function _numRegions(node, graph, visited) {
  if (visited.has(node)) return 0;

  visited.add(node);

  graph[node].forEach((neighbor) => {
    _numRegions(neighbor, graph, visited);
  });

  return 1;
}

function numRegionsSln(graph) {
  let count = 0;

  let visited = new Set();
  for (let node in graph) {
    if (depthFirst(node, graph, visited)) count++;
  }

  return count;
}

function depthFirst(node, graph, visited) {
  if (visited.has(node)) return false;

  visited.add(node);
  graph[node].forEach((neighbor) => depthFirst(neighbor, graph, visited));

  return true;
}

module.exports = {
  numRegions,
  numRegionsSln,
};
