// github.com/bephrem1/backtobackswe/blob/master/Arrays,%20Primitives,%20Strings/AdditionWithOnlyBitshifting/AdditionWithOnlyBitshifting.java
/**
 * @param {number} a
 * @param {number} b
 * @return {number}
 */

var getSum = function(a, b) {
  if (b === 0) return a;

  return getSum(a ^ b, (a & b) << 1);
};

console.log(getSum(1, 3));
console.log(getSum(1, -1));
