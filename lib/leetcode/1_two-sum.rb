# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums_hash = {}
  nums.each_with_index do |num, index|
    val = target - num
    return [nums_hash[val], index] if nums_hash[val]

    nums_hash[num] = index
  end
end

nums = [3, 8, 2, 7, 11, 15]
target = 9
p two_sum(nums, target) # [2, 3]
