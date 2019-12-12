# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  array = Array.new(nums.size)

  0.upto(nums.size - 1) do |i|
    array[(i + k) % nums.length] = nums[i]
  end

  nums.each_index do |i|
    nums[i] = array[i]
  end
end

nums = [1,2,3,4,5,6,7]
k = 3

rotate(nums, k)

# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate2(nums, k)
  j = k % nums.size

  reverse(nums, 0, nums.size - 1)
  reverse(nums, 0, j - 1)
  reverse(nums, j, nums.length - 1)
end


def reverse(nums, left, right)
  while left < right
    nums[left], nums[right] = nums[right], nums[left]

    left += 1
    right -= 1
  end
end
