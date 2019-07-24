# 53. Maximum Subarray
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  current_sum = nums[0]
  max_sum = nums[0]

  (1..(nums.size - 1)).each do |i|
    current_sum = [nums[i], current_sum + nums[i]].max
    max_sum = [current_sum, max_sum].max
  end

  max_sum
end

p max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4]) # 6
