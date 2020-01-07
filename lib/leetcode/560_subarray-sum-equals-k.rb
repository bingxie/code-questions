#Approach #1 Brute Force [Time Limit Exceeded]
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

# Time complexity : O(n^3)  Space complexity : O(1)
def subarray_sum(nums, k)
  count = 0

  0.upto(nums.size - 1) do |left|
    (left + 1).upto(nums.size) do |right|
      sum = nums[left...right].sum

      count += 1 if sum == k
    end
  end

  count
end

# Approach #3 Without space [Accepted]
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum2(nums, k)
  count = 0

  0.upto(nums.size - 1) do |left|
    sum = 0
    (left).upto(nums.size - 1) do |right|
      sum += nums[right]

      count += 1 if sum == k
    end
  end

  count
end
