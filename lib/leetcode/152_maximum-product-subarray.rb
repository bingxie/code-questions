# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  # if nums.length >= 2, one can ensure the result is non-negative
  return nums[0] if nums.length == 1

  # we keep track of max_product(nums[0, j]) and min_product(nums[0, j])
  #   and store them in pos_max and neg_max
  neg_max = 0
  pos_max = 0

  # we store the best result in variable `result'
  result = 0
  nums.each do |k|
    if k < 0
      neg_max, pos_max = [pos_max * k, k].min, neg_max * k
    elsif k > 0
      neg_max = [neg_max * k, k].min
      pos_max = [pos_max * k, k].max
    else
      neg_max = 0
      pos_max = 0
    end

    result = pos_max if pos_max > result
  end

  result
end

p max_product([2,3,-2,4])
p max_product([-2,0,-1])
p max_product([-2,-2,-2])
p max_product([-2,-2,-2,-2])
