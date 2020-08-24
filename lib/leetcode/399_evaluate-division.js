var calcEquation = function(equations, values, queries) {
  let neighbors = {};

  equations.forEach(([nom, denom], index) => {
    const curValue = values[index];

    neighbors[nom] = neighbors[nom] || [];
    neighbors[nom].push([denom, curValue]);

    neighbors[denom] = neighbors[denom] || [];
    neighbors[denom].push([nom, 1 / curValue]);
  });

  let results = [];
  for (let query of queries) {
    results.push(evaluate(query, neighbors));
  }

  return results;
};

function evaluate(query, neighbors) {
  const [nom, denom] = query;

  if (!(nom in neighbors) || !(denom in neighbors)) return -1;
  // if (!neighbors[nom] || !neighbors[denom]) return -1;

  let queue = neighbors[nom].slice();
  let visited = new Set();

  while (queue.length > 0) {
    const [variable, value] = queue.shift();

    if (variable === denom) return value;

    visited.add(variable);

    const next = neighbors[variable];
    if (next) {
      next.forEach(([next, nextValue]) => {
        if (visited.has(next)) {
          return;
        }
        queue.push([next, nextValue * value]);
      });
    }
  }

  return -1;
}

const equations = [
  ["a", "b"],
  ["b", "c"]
];
const values = [2.0, 3.0];
const queries = [["a", "c"]];

results = calcEquation(equations, values, queries);
console.log(results);
