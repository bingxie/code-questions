# Binary Search

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  return [-1, -1] if nums.nil? || nums.size == 0

  first = -1
  last = -1

  left = 0
  right = nums.size - 1

  while left < right
    mid = (left + right) / 2

    if nums[mid] >= target
      right = mid
    else
      left = mid + 1
    end
  end
  first = left if nums[left] == target

  left = 0
  right = nums.size - 1

  while left < right
    mid = (left + right) / 2

    if nums[mid] > target
      right = mid
    else
      left = mid + 1
    end
  end
  last = left - 1 if nums[left - 1] == target

  [first, last]
end

nums = [5,7,7,8,8,9,10]
target = 8

# 6 (0..5)
# left=0 right = 5, mid = 2  7 < 8
# left=3 right = 5 , mid = 4, min == 8,

p search_range(nums, target) # [3, 4]

p search_range(nums, 9) # [5, 5]

p search_range(nums, 6) # [-1, -1]


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
    # p "#{low} #{high} #{mid}"

    if (nums[mid] > target || (left && target == nums[mid]))
      high = mid
    else
      low = mid + 1
    end
  end

  low
end

nums = [5,7,7,8,8,10]
target = 8

p search_range2(nums, 8)

nums = [1]
target = 1

p search_range2(nums, target) # [0, 0]
