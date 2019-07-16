const search_min_diff_element = function(arr, key) {
  let start = 0;
  let end = arr.length - 1;

  if (key < arr[start]) {
    return arr[start];
  }
  if (key > arr[end]) {
    return arr[end];
  }

  while (start <= end) {
    mid = Math.floor(start + (end - start) / 2);
    if (key < arr[mid]) {
      end = mid - 1;
    } else if (key > arr[mid]) {
      start = mid + 1;
    } else {
      return arr[mid];
    }
  }

  // at the end of the while loop, 'start === end+1'
  // we are not able to find the element in the given array
  // return the element which is closest to the 'key'
  if (arr[start] - key < key - arr[end]) {
    return arr[start];
  }

  return arr[end];
};

console.log(search_min_diff_element([4, 6, 10], 7)); // 6
console.log(search_min_diff_element([4, 6, 10], 4)); // 4
console.log(search_min_diff_element([1, 3, 8, 10, 15], 12)); // 10
console.log(search_min_diff_element([4, 6, 10], 17)); // 10
