# Tags: #sum, #3sum
require 'set'
# @param {Integer[]} nums
# @return {Integer[][]}

# Three pointers solutions + Set
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

# Sort + Two pointers (for two sum)

def three_sum2(nums)
  sorted_nums = nums.sort

  results = Set.new

  sorted_nums[0...sorted_nums.size - 2].each_with_index do |num, index|
    break if num > 0 # 已经排序，并且只看右面，所以大于0就不需要继续了。
    next if index > 0 && num == sorted_nums[index - 1] # 可以减少重复的计算

    find_two_sum(index, sorted_nums, results)
  end

  results.to_a
end

def find_two_sum(root_index, sorted_nums, results)
  left = root_index + 1
  right = sorted_nums.size - 1

  while left < right
    #p "root_index: #{root_index} left:#{left} right: #{right}"
    sum = sorted_nums[root_index] + sorted_nums[left] + sorted_nums[right]

    if sum.zero?
      results.add [sorted_nums[root_index], sorted_nums[left], sorted_nums[right]]
      left += 1
      right -= 1
    elsif sum < 0
      left += 1
    else
      right -= 1
    end
  end
end

nums = [-1, 0, 1, 2, -1, -4]
p three_sum2(nums)
