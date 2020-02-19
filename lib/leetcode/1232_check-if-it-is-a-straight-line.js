/**
 * @param {number[][]} coordinates
 * @return {boolean}
 */
const checkStraightLine = coordinates => {
  if (coordinates.length == 1) {
    return true;
  }

  let slope;
  for (let i = 0; i < coordinates.length - 1; i++) {
    let new_slope = Math.abs(
      (coordinates[i + 1][0] - coordinates[i][0]) /
        (coordinates[i + 1][1] - coordinates[i][1])
    );

    if (slope == undefined) {
      slope = new_slope;
    } else if (slope !== new_slope) {
      return false;
    }
  }

  return true;
};

console.log(
  checkStraightLine([
    [1, 2],
    [2, 3],
    [3, 4],
    [4, 5],
    [5, 6],
    [6, 7]
  ])
); // true
