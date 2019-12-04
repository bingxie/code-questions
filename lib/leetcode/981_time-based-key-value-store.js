/**
 * Initialize your data structure here.
 */
var TimeMap = function() {
  this.map = {};
};

/**
 * @param {string} key
 * @param {string} value
 * @param {number} timestamp
 * @return {void}
 */
TimeMap.prototype.set = function(key, value, timestamp) {
  let list = this.map[key];

  if (list === undefined) {
    this.map[key] = [];
  }

  this.map[key].push([timestamp, value]);
};

/**
 * @param {string} key
 * @param {number} timestamp
 * @return {string}
 */
TimeMap.prototype.get = function(key, timestamp) {
  let list = this.map[key];
  if (list === undefined) {
    return "";
  }

  let n = list.length;
  // check head and tail
  if (timestamp >= list[n - 1][0]) {
    return list[n - 1][1];
  } else if (timestamp < list[0][0]) {
    return "";
  }

  let l = 0,
    r = n; // 目的是让最终的结果落在左侧
  while (l < r) {
    let mid = Math.floor((l + r) / 2);

    if (list[mid][0] == timestamp) {
      return list[mid][1];
    } else if (list[mid][0] < timestamp) {
      l = mid + 1;
    } else {
      r = mid - 1;
    }
  }
  return list[l][1];
};

/**
 * Your TimeMap object will be instantiated and called as such:
 * var obj = new TimeMap()
 * obj.set(key,value,timestamp)
 * var param_2 = obj.get(key,timestamp)
 */
