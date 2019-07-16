const find_max_in_bitonic_array = function(arr) {
  let start = 0;
  let end = arr.length - 1;

  while (start < end) {
    mid = Math.floor(start + (end - start) / 2);

    if (arr[mid] > arr[mid + 1]) {
      end = mid;
    } else {
      start = mid + 1;
    }
  }

  // at the end of the while loop, 'start === end'
  return arr[start];
};

console.log(find_max_in_bitonic_array([1, 3, 8, 12, 4, 2])); // 12
console.log(find_max_in_bitonic_array([3, 8, 3, 1])); // 8
console.log(find_max_in_bitonic_array([1, 3, 8, 12])); //12
console.log(find_max_in_bitonic_array([10, 9, 8])); // 10
