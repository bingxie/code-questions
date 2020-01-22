# Tags: #Binary Search

# https://leetcode.com/problems/binary-search/
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  return -1 if nums.nil? || nums.empty?

  left = 0
  right = nums.size - 1

  while left <=  right
    mid = left + (right - left) / 2

    return mid if nums[mid] == target

    puts "mid: #{mid}"
    if nums[mid] > target
      right = mid - 1
    else
      left = mid + 1
    end
  end

  -1
end

nums = [-1, 0, 3, 5, 9, 12]
target = 13

puts search(nums, target) # -1
