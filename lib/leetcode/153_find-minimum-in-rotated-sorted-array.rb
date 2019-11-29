# @param {Integer[]} nums
# @return {Integer}
# Easy understand version
# see: https://leetcode.com/articles/find-minimum-in-rotated-sorted-array/
def find_min2(nums)
  return nil if nums.empty?

  low = 0
  high = nums.size - 1

  return nums[low] if nums[high] >= nums[low]

  while low <= high
    mid = low + (high - low) / 2

    return nums[mid + 1] if nums[mid] > nums[mid + 1]
    return nums[mid] if nums[mid] < nums[mid - 1]

    if nums[mid] > nums[low]
      low = mid + 1
    else
      high = mid - 1
    end
  end
end

p find_min2([3,4,5,1,2])
p find_min2([4,5,6,7,0,1,2])
p find_min2([1,2,3,4,5])

def find_min(nums)
  floor = 0
  ceiling = nums.length - 1

  while floor < ceiling do
    mid = floor + (ceiling - floor) / 2

    if nums[mid] < nums[ceiling]
      ceiling = mid
    else
      floor = mid + 1
    end
  end

  nums[floor]  # floor == celing
end

p find_min([3,4,5,1,2])
p find_min([4,5,6,7,0,1,2])
p find_min([1,2,3,4])
