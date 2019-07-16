# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_in_rotated_sorted_array(nums, target)
  floor_index = 0
  ceiling_index = nums.length - 1
  first_num = nums[0]

  while floor_index <= ceiling_index
    guess_index = floor_index + (ceiling_index-floor_index)/2
    guess_num = nums[guess_index]

    return guess_index if target == guess_num

    if (first_num <= target && target < guess_num) ||
      (target < guess_num &&  guess_num < first_num) ||
      (guess_num < first_num && first_num <=target)
      ceiling_index = guess_index - 1
    else
      floor_index = guess_index + 1
    end
  end

  return -1
end

# nums = [4,5,6,7,0,1,2]
# puts search_in_rotated_sorted_array(nums, 0)  # 4
# puts search_in_rotated_sorted_array(nums, 4)  # 0
# puts search_in_rotated_sorted_array(nums, 7)  # 3
# puts search_in_rotated_sorted_array(nums, 6)  # 2
# puts search_in_rotated_sorted_array(nums, 2)  # 6

# 思路：从两头往中间逼近, 二分后总有一半是ascending的
def search_in_rotated_sorted_array2(nums, target)
  floor = 0
  ceiling = nums.length - 1

  while floor <= ceiling
    mid = floor + (ceiling - floor) / 2

    return mid if nums[mid] == target

    if nums[floor] < nums[mid]  # left part is ascending
      return floor if nums[floor] == target

      if nums[floor] < target && target < nums[mid]   # target in left part
        ceiling = mid -1
      else
        floor = mid + 1
      end
    else # right part is ascending
      return ceiling if nums[ceiling] == target

      if nums[mid] < target && target < nums[ceiling]
        floor = mid + 1
      else
        ceiling = mid -1
      end
    end
  end

  -1
end

nums = [4,5,6,7,0,1,2]
puts search_in_rotated_sorted_array2(nums, 0)  # 4
puts search_in_rotated_sorted_array2(nums, 4)  # 0
puts search_in_rotated_sorted_array2(nums, 7)  # 3
puts search_in_rotated_sorted_array2(nums, 6)  # 2
puts search_in_rotated_sorted_array2(nums, 2)  # 6

nums = [5,1,3]
p search_in_rotated_sorted_array2(nums, 5) # 0

nums = [3, 1]
p search_in_rotated_sorted_array2(nums, 1)  # 1

p search_in_rotated_sorted_array2([5,1,2,3,4], 1) # 1

p search_in_rotated_sorted_array2([1], 1)  # 0