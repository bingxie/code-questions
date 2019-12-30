# 方法一： 使用hashmap来进行统计次数
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  hash_count = Hash.new(0)

  nums.each do |num|
    hash_count[num] += 1
    return num if hash_count[num] > (nums.size / 2)
  end
end

p majority_element([2,2,1,1,1,2,2])

# 方法二：先排序，然后中间的就是majority-element
# @param {Integer[]} nums
# @return {Integer}
def majority_element2(nums)
  nums.sort[nums.size / 2]
end

# 方法三：随机选择后统计次数
# @param {Integer[]} nums
# @return {Integer}
def majority_element3(nums)
  majority_count= nums.size / 2

  while true
    candidate = nums.sample
    return candidate if count_occurences(nums, candidate) > majority_count
  end
end

def count_occurences(nums, num)
  count = 0

  nums.each do |n|
    count += 1 if n == num
  end

  count
end

# 方法四：Divide and Conquer
# Time：O(nlog(n))  Space: log(n)
def majority_element4(nums)
  majority_element_recursive(nums, 0, nums.size - 1)
end

def majority_element_recursive(nums, low, high)
  return nums[low] if low == high

  mid = (high - low) / 2 + low

  left = majority_element_recursive(nums, low, mid)
  right = majority_element_recursive(nums, mid+1, high)

  return left if left == right

  left_count = count_in_range(nums, left, low, high)
  right_count = count_in_range(nums, right, low, high)

  left_count > right_count ? left : right
end

def count_in_range(nums, num, low, high)
  count = 0

  low.upto(high) do |i|
    count += 1 if nums[i] == num
  end

  count
end

# 方法五： Boyer-Moore Voting Algorithm
def majority_element(nums)
  count = 0
  candidate = nil

  nums.each do |num|
    candidate = num if count == 0

    count += num == candidate ? 1 : -1
  end

  candidate
end
