# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums_hash = {}
  nums.each_with_index do |num, index|
      val = target - num
      if nums_hash[val]
          return [nums_hash[val], index]
      end
      nums_hash[nums[index]] = index
  end
end

nums = [3, 8, 2, 7, 11, 15]
target = 9
p two_sum(nums, target)