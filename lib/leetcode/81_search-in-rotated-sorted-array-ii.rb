# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_in_rotated_sorted_array_ii(nums, target)
  floor = 0
  ceiling = nums.length - 1

  while floor <= ceiling
    return nums[floor] == target if floor == ceiling

    mid = floor + (ceiling - floor) / 2

    return true if nums[mid] == target

    # 当floor或者ceiling 跟mid相同是，移动floor或者ceiling
    if (floor!= mid && nums[floor] == nums[mid])
      floor += 1
      next
    elsif (ceiling != mid && nums[ceiling] == nums[mid])
      ceiling -= 1
      next
    end

    if nums[floor] < nums[mid]  # left part is ascending
      return true if nums[floor] == target

      if nums[floor] < target && target < nums[mid]   # target in left part
        ceiling = mid -1
      else
        floor = mid + 1
      end
    else # right part is ascending
      return true if nums[ceiling] == target

      if nums[mid] < target && target < nums[ceiling]
        floor = mid + 1
      else
        ceiling = mid -1
      end
    end
  end

  false
end

# nums = [2,5,6,0,0,1,2]
# puts search_in_rotated_sorted_array_ii(nums, 0)  # true
# puts search_in_rotated_sorted_array_ii(nums, 3)  # false

nums = [1,3]
puts search_in_rotated_sorted_array_ii(nums, 3) # true

# puts search_in_rotated_sorted_array_ii([1,1], 2) # false

# puts search_in_rotated_sorted_array_ii([3,1,1], 3) # true

# puts search_in_rotated_sorted_array_ii([1,1,3], 3) # true
#puts search_in_rotated_sorted_array_ii([1,3,5], 5) # true