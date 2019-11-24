# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

# https://youtu.be/LPFhl65R7ww 参考视频
# Time complexity is O(log(min(x,y))
# Space complexity is O(1)

def find_median_sorted_arrays(nums1, nums2)
  if nums1.size > nums2.size
    return find_median_sorted_arrays(nums2, nums1)  # make nums1's size smaller than nums2's size
  end

  nums1_size = nums1.size
  nums2_size = nums2.size

  low = 0
  high = nums1_size

  while low <=high
    mid_1 = (low + high) / 2
    mid_2 = (nums1_size + nums2_size + 1) / 2 - mid_1

    max_left_1 = mid_1 == 0 ? -Float::INFINITY : nums1[mid_1 - 1]   # 处理edge cases
    min_right_1 = mid_1 == nums1_size ? Float::INFINITY : nums1[mid_1]

    max_left_2 = mid_2 == 0 ? -Float::INFINITY : nums2[mid_2 - 1]
    min_right_2 = mid_2 == nums2_size ? Float::INFINITY : nums2[mid_2]

    if max_left_1 <= min_right_2 && max_left_2 <= min_right_1
      if (nums1_size + nums2_size).even?
        return ([max_left_1, max_left_2].max + [min_right_1, min_right_2].min) / 2.0
      else
        return [max_left_1, max_left_2].max.to_f
      end
    elsif max_left_1 > min_right_2
      high = mid_1 - 1
    else
      low = mid_1 + 1
    end
  end
end

nums1 = [1, 3]
nums2 = [2]

p find_median_sorted_arrays(nums1, nums2)

nums1 = [1, 2]
nums2 = [3, 4]

p find_median_sorted_arrays(nums1, nums2)

# another solution:  https://www.youtube.com/watch?v=oVPIQdHt_T8
# O(log(m+n))
