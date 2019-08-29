# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  i = 0
  size = nums.size
  while i < size - 1

    j = i + 1
    if nums[i] == nums[j]
      nums.delete_at(i)
      size -= 1
    else
      i += 1
    end
  end
  nums.size
end

# nums = [1,1,2]
# p remove_duplicates(nums)

nums = [0,0,1,1,1,2,2,3,3,4]
p remove_duplicates(nums)
p nums


def remove_duplicates2(nums)  # 这种方法只是把不重复的交换到前面
  length = nums.length

  return length if length < 2
  i = 0
  j = i + 1

  while j < length
    if nums[i] == nums[j]
      j += 1
    else
      i += 1
      nums[i] = nums[j]
    end
  end
  i + 1
end

nums = [0,0,1,1,1,2,2,3,3,4]
p remove_duplicates2(nums)
p nums