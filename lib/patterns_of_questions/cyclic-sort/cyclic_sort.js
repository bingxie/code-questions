function cyclic_sort(nums) {
  let start = 0;

  while (start < nums.length) {
    if (nums[start] === start + 1) {
      start += 1;
    } else {
      const start_value = nums[start];

      nums[start] = nums[start_value - 1];
      nums[start_value - 1] = start_value;
    }
  }

  return nums;
}

console.log(cyclic_sort([2, 4, 1, 5, 3]));
console.log(cyclic_sort([2, 6, 4, 3, 1, 5]));
