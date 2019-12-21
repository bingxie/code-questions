# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  last_position = nums.size - 1

  (nums.size - 1).downto(0) do |i|
    last_position = i if i + nums[i] >= last_position
  end

  last_position == 0
end

nums = [2, 3, 1, 1, 4]

p can_jump(nums) # true

nums = [3, 2, 1, 0, 4]
p can_jump(nums) # false
