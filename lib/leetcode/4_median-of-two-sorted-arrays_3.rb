# Tags： Binary Search, Array

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

# 参考视频 https://www.youtube.com/watch?v=oVPIQdHt_T8&t=1273s

def find_median_sorted_arrays(nums1, nums2)
  size = nums1.size + nums2.size
  if size.even?
    (findKth(nums1, 0, nums2, 0, size / 2) + findKth(nums1, 0, nums2, 0, size / 2 + 1)) / 2.0
  else
    findKth(nums1, 0, nums2, 0, size / 2 + 1).to_f
  end
end

def findKth(nums1, start1, nums2, start2, k)
  if start1 >= nums1.size
    return nums2[start2 + k - 1]
  end

  if start2 >= nums2.size
    return nums1[start1 + k - 1]
  end

  if k == 1
    return [nums1[start1], nums2[start2]].min
  end

  index1 = start1 + k / 2 - 1
  index2 = start2 + k / 2 - 1

  n1 = index1 < nums1.size ? nums1[index1] : Float::INFINITY
  n2 = index2 < nums2.size ? nums2[index2] : Float::INFINITY

  if n1 < n2
    return findKth(nums1, start1 + k / 2, nums2, start2, k - k / 2)
  else
    return findKth(nums1, start1, nums2, start2 + k / 2, k - k / 2)
  end
end

nums1 = [1, 3]
nums2 = [2]

p find_median_sorted_arrays(nums1, nums2)

nums1 = [1, 2]
nums2 = [3, 4]

p find_median_sorted_arrays(nums1, nums2)

nums1 = [1]
nums2 = [2,3,4,5,6]
p find_median_sorted_arrays(nums1, nums2)
