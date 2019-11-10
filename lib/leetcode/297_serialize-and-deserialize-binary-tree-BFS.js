var serialize = function(root) {
  if (!root) return [];

  const out = [];

  const bfs = [root];

  while (bfs.length) {
    const current = bfs.shift();

    if (!current) {
      out.push(null);
      continue;
    }

    const { val, left, right } = current;

    out.push(val);

    bfs.push(left);
    bfs.push(right);
  }

  return out;
};

var deserialize = function(data) {
  if (!data.length) return null;

  const head = new TreeNode(data.shift()); // create the root node
  const bfs = [head];

  while (data.length && bfs.length) {
    const current = bfs.shift();

    const left = data.shift();
    const right = data.shift();

    current.left = Number.isInteger(left) ? new TreeNode(left) : null;
    current.right = Number.isInteger(right) ? new TreeNode(right) : null;

    if (current.left !== null) bfs.push(current.left);
    if (current.right !== null) bfs.push(current.right);
  }

  return head;
};
