# Time Limit Exceeded

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  memo = Array.new(nums.size, 'UNKNOW')
  memo[memo.size - 1] = 'GOOD'

  can_jump_from_position(0, nums, memo)
end

def can_jump_from_position(position, nums, memo)
  return memo[position] == 'GOOD' if memo[position] != 'UNKNOW'

  furthest_jump = [position + nums[position], nums.size - 1].min

  (position + 1..furthest_jump).each do |next_position|
    if can_jump_from_position(next_position, nums, memo)
      memo[position] = 'GOOD'
      return true
    end
  end

  memo[position] = 'BAD'
  false
end

nums = [2, 3, 1, 1, 4]

p can_jump(nums) # true

nums = [3, 2, 1, 0, 4]
p can_jump(nums) # false
