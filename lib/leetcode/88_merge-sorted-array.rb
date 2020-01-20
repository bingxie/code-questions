# 从尾部开始比较,
def merge(nums1, m, nums2, n)
  while (m > 0) && (n > 0)
    if nums1[m - 1] >= nums2[n - 1]
      nums1[m + n - 1] = nums1[m - 1]
      m -= 1
    else
      nums1[m + n - 1] = nums2[n - 1]
      n -= 1
    end
  end

  nums1[0...n] = nums2[0...n] if n > 0  # nums1都已经排好, 把nums2剩下的放到最前面
end
