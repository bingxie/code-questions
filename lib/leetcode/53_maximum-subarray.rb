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

# O(n*3)  Time Limit Exceeded
def max_sub_array2(nums)
  ans = nums[0]

  (1..nums.size).each do |size|
    nums.each_cons(size) do |a|
      ans = [ans, a.sum].max
    end
  end

  ans
end
p max_sub_array2([-2, 1, -3, 4, -1, 2, 1, -5, 4]) # 6

# Approach 3: Dynamic Programming (Kadane's algorithm)
def max_sub_array3(nums)
  max_sum = nums[0]

  (1...nums.size).each do |i|
    # nums[i] 记录到该位置时，可能获得的最大和
    # 如果前面的一个是正的，那么就加上
    # 如果前面的是付的，那么就保留当前值
    nums[i] += nums[i - 1] if nums[i - 1] > 0
    max_sum = [nums[i], max_sum].max
  end
  p nums
  p nums.max
  max_sum
end
p max_sub_array3([-2, 1, -3, 4, -1, 2, 1, -5, 4]) # 6
