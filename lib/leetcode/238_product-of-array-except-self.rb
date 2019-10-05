# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  if nums&.size < 2
    raise IndexError, "error"
  end

  results = []

  product_so_far = 1
  last_index = nums.length - 1

  (0..last_index).each do |i|
    results[i] = product_so_far
    product_so_far *= nums[i]
  end

  p results

  product_so_far = 1

  last_index.downto(0).each do |i|
    results[i] *= product_so_far
    product_so_far *= nums[i]
  end

  results
end

p product_except_self([1,2,3,4])
