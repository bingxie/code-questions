# Approach 2: Better Brute Force
# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
  left = nums.length
  right = 0

  (0..nums.size - 2).each do |i|
    (i+1..nums.size - 1).each do |j|
      if nums[j] < nums[i]
        left = [i, left].min
        right = [j, right].max
      end
    end
  end

  right < left ? 0 : right - left + 1
end
nums = [2, 7, 6, 8, 4, 10, 9, 15]
p find_unsorted_subarray(nums)

# Approach 3: Using Sorting
def find_unsorted_subarray2(nums)
  sort_nums = nums.sort

  left = nums.length
  right = 0

  sort_nums.each_with_index do |num, index|
    if num != nums[index]
      left = [index, left].min
      right = [index, right].max
    end
  end

  right >= left ? right - left + 1 : 0
end

nums = [2, 7, 6, 8, 4, 10, 9, 15]
p find_unsorted_subarray2(nums)

# Approach 4: Using Stack
def find_unsorted_subarray3(nums)
  left = nums.length
  right = 0

  stack = []

  nums.each_with_index do |num, index|
    while !stack.empty? && nums[stack.last] > num
      left = [left, stack.pop].min
    end
    stack.push index
  end

  stack.clear

  (nums.size - 1).downto(0) do |index|
    while !stack.empty? && nums[stack.last] < nums[index]
      right = [right, stack.pop].max
    end
    stack.push index
  end

  right > left ? right - left + 1 : 0
end
nums = [2, 7, 6, 8, 4, 10, 9, 15]
p find_unsorted_subarray3(nums)

# Approach 5: Without Using Extra Space
def find_unsorted_subarray4(nums)
  min = Float::INFINITY
  max = -Float::INFINITY

  flag = false

  nums.each_cons(2) do |n1, n2|
    flag = true if n2 < n1
    min = [min, n2].min if flag
  end

  flag = false
  nums.reverse.each_cons(2) do |n1, n2|
    flag = true if n2 > n1
    max = [max, n2].max if flag
  end

  left = nums.length
  right = 0

  (0..nums.size - 1).each do |index|
    left = index
    break if nums[index] > min
  end

  (nums.size - 1).downto(0) do |index|
    right = index
    break if nums[index] < max
  end

  right > left ? right - left + 1 : 0
end
nums = [2, 7, 6, 8, 4, 10, 9, 15]
p find_unsorted_subarray4(nums)
