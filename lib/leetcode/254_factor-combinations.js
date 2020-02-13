var getFactors = function(n) {
  const ans = [];

  const helper = (sofar, n, start) => {
    if (n <= 1) {
      if (sofar.length > 1) {
        ans.push(sofar.concat()); // a clone of sofar array
        return;
      } else {
        return [];
      }
    }

    for (var i = start; i <= n; i++) {
      // n = 8, 2,
      if (n % i === 0) {
        sofar.push(i); // [2, 2]
        helper(sofar, n / i, i);
        sofar.pop();
      }
    }
  }; // helper

  helper([], n, 2);
  return ans;
};
