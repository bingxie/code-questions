# Recursive  O(n*n)
# @param {Integer[]} nums
# @return {Integer[][]}

def subsets(nums, i = 0)
  puts "call"
  return [[]] if nums.size == 0

  without_first_subset = subsets(nums[1..-1])

  without_first_subset + without_first_subset.map do |subset|
    puts 'call - inside'
    subset + [nums.first]
  end
end

# pp subsets([1,2,3,4])

# Iterative  o(n*n)
def subsets2(nums, i = 0)
  result = [[]]
  n = 0

  nums.each do |num|
      len = result.size
      i = 0
      while i < len
          new_subset = result[i] + [num]
          result << new_subset
          i += 1
      end
  end

  result
end
pp subsets2([1,2,3])