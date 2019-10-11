# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
  (0..nums.size - 2).each do |i|
    swap(nums, i, i+1) if (i.even? && nums[i] > nums[i+1]) || (i.odd? && nums[i] < nums[i+1])
  end
  nums
end

def swap(nums, i, j)
  temp = nums[i]
  nums[i] = nums[j]
  nums[j] = temp
end

nums = [3, 5, 2, 1, 6, 4]

p wiggle_sort(nums)
