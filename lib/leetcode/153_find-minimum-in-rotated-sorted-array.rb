# @param {Integer[]} nums
# @return {Integer}
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