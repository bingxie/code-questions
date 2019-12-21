# Time Limit Exceeded

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  memo = Array.new(nums.size, 'UNKNOW')
  memo[memo.size - 1] = 'GOOD'

  (nums.length - 2).downto(0) do |i| # 从后往前倒着看
    furthest_jump = [i + nums[i], nums.size - 1].min
    (i + 1).upto(furthest_jump) do |j|
      if memo[j] == 'GOOD'
        memo[i] = 'GOOD'
        break
      end
    end
  end

  memo[0] == 'GOOD'
end

nums = [2, 3, 1, 1, 4]

p can_jump(nums) # true

nums = [3, 2, 1, 0, 4]
p can_jump(nums) # false
