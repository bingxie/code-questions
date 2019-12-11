# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  array = Array.new(nums.size + 1)

  nums.each do |num|
    array[num] = 1
  end

  array.each_with_index do |num, index|
    return index if num.nil?
  end
end
