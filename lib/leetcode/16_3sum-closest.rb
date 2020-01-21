# Tags: #3sum, #sum, #closest
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!

  result = nums[0..2].sum

  0.upto(nums.size - 2) do |i|
    j = i + 1
    k = nums.size - 1

    while j < k
      sum = nums[i] + nums[j] + nums[k]

      return sum if sum == target

      result = sum if (sum - target).abs < (result - target).abs

      if sum < target
        j += 1
      else
        k -= 1
      end
    end
  end

  result
end

def two_sum_closest(nums, target)
  nums.sort!

  i = 0
  j = nums.size - 1

  while i < j
    return [nums[i], nums[j]] if nums[i] + nums[j] == target

    return [nums[i], nums[j]] if i == j - 1

    if nums[i] + nums[j] < target
      i += 1
    else
      j -= 1
    end
  end
end

nums = [-1, 2, 1, -4]
target = 1


p three_sum_closest(nums, target)
