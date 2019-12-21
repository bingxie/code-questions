# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  can_jump_from_position(0, nums)
end

def can_jump_from_position(position, nums)
  return true if position == nums.size - 1

  furthest_jump = [position + nums[position], nums.size - 1].min

  (position + 1..furthest_jump).each do |next_position|
    return true if can_jump_from_position(next_position, nums)
  end

  false
end

nums = [2, 3, 1, 1, 4]

p can_jump(nums) # true

nums = [3, 2, 1, 0, 4]
p can_jump(nums) # false
