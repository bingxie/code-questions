# Tags： Binary Search, Array
# 参考视频 https://www.youtube.com/watch?v=oVPIQdHt_T8&t=1273s

def find_median_sorted_arrays(nums1, nums2)
  size = nums1.size + nums2.size
  if size.even?
    (getKth(nums1, nums2, (size - 1) / 2) + getKth(nums1, nums2, size / 2)) / 2.0
  else
    getKth(nums1, nums2, (size - 1) / 2)
  end
end

# Returns the k-th element assuming nums1 and nums2 are sorted
# k is 0-based (e.g. k == 0 returns the min element).
def getKth(nums1, nums2, k)
  p "nums1: #{nums1}   nums2: #{nums2}   k: #{k}"

  return nums2[k] if nums1.size == 0
  return nums1[k] if nums2.size == 0

  mid1 = nums1.size / 2
  mid2 = nums2.size / 2

  if nums1[mid1] > nums2[mid2]
    return getKth(nums2, nums1, k)
  end

  if mid1 + mid2 + 1 > k
    return getKth(nums1, nums2[0...mid2], k)
  else
    return getKth(nums1[mid1+1..-1], nums2, k - mid1 - 1)
  end
end

nums1 = [1, 3]
nums2 = [2]

p find_median_sorted_arrays(nums1, nums2)

nums1 = [1, 2]
nums2 = [1, 3, 5]

p find_median_sorted_arrays(nums1, nums2)

nums1 = [23, 26, 31, 35]
nums2 = [3, 5, 7, 9, 11, 16]

p find_median_sorted_arrays(nums1, nums2)
