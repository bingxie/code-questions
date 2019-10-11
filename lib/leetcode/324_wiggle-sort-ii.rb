# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
  nums.sort! # sort  O(nlog(n))

  mid = (nums.size - 1) / 2
  small = nums.slice(0..mid)
  large = nums.slice(mid + 1..-1)

  (0..nums.size - 1).each do |i|
    nums[i] = if i.even?
                small.pop
              else
                large.pop
              end
  end
  nums
end

nums = [1, 5, 1, 1, 6, 4]

p wiggle_sort(nums)

nums = [1, 3, 2, 2, 3, 1]

p wiggle_sort(nums)

nums = [1, 2, 2, 1, 2, 1, 1, 1, 1, 2, 2, 2]
p wiggle_sort(nums)

nums = [4,5,5,6]
p wiggle_sort(nums)
