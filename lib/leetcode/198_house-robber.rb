# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  prev_max = 0
  curr_max = 0

  nums.each do |num|
    temp = curr_max
    curr_max = [prev_max + num, curr_max].max
    prev_max = temp
  end

  curr_max
end

# DP solution
def rob2(nums)
  return 0 if nums.empty?
  return nums[0] if nums.size == 1

  dp = []
  dp[0] = nums[0]
  dp[1] = [nums[0], nums[1]].max

  2.upto(nums.size-1) do |i|
    dp[i] = [dp[i-2] + nums[i], dp[i-1]].max
  end

  dp.last
end

p rob2([2, 7, 9, 3, 1])
