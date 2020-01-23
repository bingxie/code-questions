# Topic: binary search

# https://leetcode.com/problems/search-in-rotated-sorted-array/
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_in_rotated_sorted_array(nums, target)
  floor_index = 0
  ceiling_index = nums.length - 1
  first_num = nums[0]

  while floor_index <= ceiling_index
    guess_index = floor_index + (ceiling_index - floor_index) / 2
    guess_num = nums[guess_index]

    return guess_index if target == guess_num

    if (first_num <= target && target < guess_num) ||
       (target < guess_num && guess_num < first_num) ||
       (guess_num < first_num && first_num <= target)
      ceiling_index = guess_index - 1
    else
      floor_index = guess_index + 1
    end
  end

  -1
end

# nums = [4,5,6,7,0,1,2]
# puts search_in_rotated_sorted_array(nums, 0)  # 4
# puts search_in_rotated_sorted_array(nums, 4)  # 0
# puts search_in_rotated_sorted_array(nums, 7)  # 3
# puts search_in_rotated_sorted_array(nums, 6)  # 2
# puts search_in_rotated_sorted_array(nums, 2)  # 6

# 思路：从两头往中间逼近, 二分后总有一半是ascending的, 只需要扫描一遍
def search_in_rotated_sorted_array2(nums, target)
  floor = 0
  ceiling = nums.length - 1

  while floor <= ceiling
    mid = floor + (ceiling - floor) / 2

    return mid if nums[mid] == target

    if nums[floor] < nums[mid] # left part is ascending
      return floor if nums[floor] == target ### 检查floor，可以快速返回

      if nums[floor] < target && target < nums[mid] # target in left part
        ceiling = mid - 1
      else
        floor = mid + 1
      end
    else # right part is ascending
      return ceiling if nums[ceiling] == target ### 检查ceiling，可以快速返回

      if nums[mid] < target && target < nums[ceiling]
        floor = mid + 1
      else
        ceiling = mid - 1
      end
    end
  end

  -1
end

nums = [4, 5, 6, 7, 0, 1, 2]
puts search_in_rotated_sorted_array2(nums, 0)  # 4
puts search_in_rotated_sorted_array2(nums, 4)  # 0
puts search_in_rotated_sorted_array2(nums, 7)  # 3
puts search_in_rotated_sorted_array2(nums, 6)  # 2
puts search_in_rotated_sorted_array2(nums, 2)  # 6

nums = [5, 1, 3]
p search_in_rotated_sorted_array2(nums, 5) # 0

nums = [3, 1]
p search_in_rotated_sorted_array2(nums, 1) # 1

p search_in_rotated_sorted_array2([5, 1, 2, 3, 4], 1) # 1

p search_in_rotated_sorted_array2([1], 1) # 0

# -----------
# 分步骤, 扫描两遍的方法.
# 1. 先找到rotated的index
# 2. 然后当成两个分别排好序的数组,进行binary search
def search_in_rotated_sorted_array3(nums, target)
  return -1 if nums.empty?

  position = find_min_position(nums)
  p "position: #{position}"

  result = binary_search(nums[0..position - 1], target)
  return result if result

  result = binary_search(nums[position..-1], target)
  return -1 if result.nil?

  position + result # 注意结果要加上偏移量
end

def binary_search(nums, target)
  p "input nums: #{nums}"
  return nil if nums.empty?

  low = 0
  high = nums.size - 1

  while low <= high
    mid = low + (high - low) / 2
    return mid if nums[mid] == target

    if nums[mid] > target
      high = mid - 1
    else
      low = mid + 1
    end
  end
end

def find_min_position(nums)
  return nil if nums.empty?

  low = 0
  high = nums.size - 1

  return low if nums[high] >= nums[low]

  while low <= high
    mid = low + (high - low) / 2

    return mid + 1 if nums[mid] > nums[mid + 1]
    return mid if nums[mid] < nums[mid - 1]

    if nums[mid] > nums[low]
      low = mid + 1
    else
      high = mid - 1
    end
  end
end

p search_in_rotated_sorted_array3([3, 1], 1) # 1

p search_in_rotated_sorted_array3([5, 1, 2, 3, 4], 1) # 1

p search_in_rotated_sorted_array3([1], 1) # 0
