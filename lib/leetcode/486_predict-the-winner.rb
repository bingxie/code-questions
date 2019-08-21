# @param {Integer[]} nums
# @return {Boolean}
def predict_the_winner(nums)
  memo = Array.new(nums.length) { Array.new(nums.length) }
  winner(nums, 0, nums.length - 1, memo) >= 0
end

def winner(nums, s, e, memo)
  return nums[e] if s == e

  return memo[s][e] if memo[s][e]

  chose_left = nums[s] - winner(nums, s + 1, e, memo)
  chose_right = nums[e] - winner(nums, s, e -1, memo)

  memo[s][e] = [chose_left, chose_right].max
end



puts predict_the_winner([1, 5, 2])  # false
puts predict_the_winner([1, 5, 233, 7])  # true