# with another Array help
# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  array = Array.new(nums.size + 1)

  nums.each_with_index do |num, index|
    array[num] = index if array[num].nil?
  end

  result = []
  array.each_with_index do |num, index|
    next if index == 0
    result.push index if num.nil?
  end

  result
end

# Approach2: 通过标记为负数进行处理
# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers2(nums)
  nums.each_with_index do |num, index|
    new_index = num.abs - 1
    nums[new_index] *= -1  if nums[new_index] > 0
  end

  result = []
  nums.each_with_index do |num, index|
    result.push(index + 1) if num > 0
  end

  result
end
