function Node(val, neighbors) {
  this.val = val;
  this.neighbors = neighbors;
}

// BFS
const cloneGraph = function(node) {
  if (node === null) return null;

  let mapping = new Map();
  let queue = [node];
  let newNode = new Node(node.val, []);

  mapping.set(node, newNode);

  while (queue.length) {
    let currentNode = queue.shift();

    for (let nb of currentNode.neighbors) {
      if (!mapping.has(nb)) {
        mapping.set(nb, new Node(nb.val, []));
        queue.push(nb);
      }
      mapping.get(currentNode).neighbors.push(mapping.get(n));
    }
  }
  return mapping.get(node);
};

// DFS
let visited = new Map();

const cloneGraph = function(node) {
  if (node == null) return null;

  if (visited.has(node)) {
    return visited.get(node);
  }

  let cloneNode = new Node(node.val, []);

  visited.set(node, cloneNode);

  for (let nb of node.neighbors) {
    cloneNode.neighbors.push(cloneGraph(nb));
  }

  return cloneNode;
};
