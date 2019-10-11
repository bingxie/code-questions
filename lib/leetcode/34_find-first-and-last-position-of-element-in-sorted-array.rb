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
  last = left -1 if nums[left - 1] == target

  [first, last]
end

nums = [5,7,7,8,8,10]
target = 8

# 6 (0..5)
# left=0 right = 5, mid = 2  7 < 8
# left=3 right = 5 , mid = 4, min == 8,

p search_range(nums, target) # [3, 4]

p search_range(nums, 6) # [-1, -1]
