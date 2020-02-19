const mySqrt = function(x) {
  if (x <= 1) {
    return x;
  }

  let l = 1;
  let r = x; // 进一步缩小，可以用 r = Math.floor(x / 2)
  // 用二分查找的方法，
  while (l <= r) {
    let mid = l + Math.floor((r - l) / 2);

    if (mid * mid === x) {
      return mid;
    }

    if (mid > x / mid) {
      // prevent overflow
      r = mid - 1;
    } else {
      if ((mid + 1) * (mid + 1) > x) {
        // 特殊情况的处理
        return mid;
      }

      l = mid + 1;
    }
  }
};

console.log(mySqrt(8));

console.log(mySqrt(15));

const mySqrt2 = function(x) {
  if (x <= 1) {
    return x;
  }

  let l = 1;
  let r = Math.floor(x / 2);

  while (l <= r) {
    let mid = l + Math.floor((r - l) / 2);

    if (mid * mid === x) {
      return mid;
    }

    if (mid > x / mid) {
      // prevent overflow
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }

  return r;
};
