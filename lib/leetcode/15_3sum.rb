# Tags: sum 3sum
require 'set'
# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  return [] if nums.size < 3

  return [[0, 0, 0]] if nums.uniq == [0]

  nums.sort!
  result = Set.new

  (1..nums.size-2).step(1) do |middle|
    left = middle - 1
    right = middle + 1

    while left >= 0 && right < nums.size
      sum = nums[left] + nums[middle] + nums[right]

      if sum == 0
        result.add [nums[left], nums[middle], nums[right]]
        left -= 1
      end

      left -= 1 if sum > 0
      right += 1 if sum < 0
    end
  end

  result.to_a
end

nums = [-1, 0, 1, 2, -1, -4]
p three_sum(nums)

nums = [3,0,-2,-1,1,2]
p three_sum(nums) # [[-2,-1,3],[-2,0,2],[-1,0,1]]
