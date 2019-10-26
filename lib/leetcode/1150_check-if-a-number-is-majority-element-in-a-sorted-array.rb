# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}

# 跟34题很像
def is_majority_element(nums, target)
  first, last = search_range2(nums, target)

  return false if first == -1

  (last - first + 1) > nums.size / 2
end

def search_range2(nums, target)
  return [-1, -1] if nums.nil? || nums.size == 0

  first = find_index(nums, target, true)
  return [-1, -1] if nums[first] != target

  last = find_index(nums, target, false) - 1

  [first, last]
end

def find_index(nums, target, left)
  low = 0
  high = nums.size

  while low < high
    mid = low + (high - low) / 2

    if (nums[mid] > target || (left && target == nums[mid]))
      high = mid
    else
      low = mid + 1
    end
  end

  low
end
