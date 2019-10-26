# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  zero_index = -1

  nums.each_with_index do |num, i|
    if zero_index == -1
      zero_index = i if num.zero?   # 先找到第一个0的位置
    elsif num.nonzero?
      swap(nums, zero_index, i)
      zero_index += 1
    end
  end

  nums
end

def swap(nums, i, j)
  tmp = nums[i]
  nums[i] = nums[j]
  nums[j] = tmp
end

nums = [0,1,0,3,12]
# p move_zeroes(nums)  # [1,3,12,0,0]
nums = [1,0,1]
# p move_zeroes(nums)  # [1,0,1]

def move_zeroes2(nums)
  return nums unless nums&.include?(0)

  swaped = true
  while swaped
    swaped = false
    nums.each_with_index do |num, i|
      j = i + 1
      break if j == nums.size

      if num == 0
        if nums[j] == 0
          next
        else
          swap(nums, i, j)
          swaped = true
        end
      end
    end
  end

  p nums
end

nums = [0,1,0,3,12]
move_zeroes2(nums)  # [1,3,12,0,0]
