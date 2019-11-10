# Recursive  O(2pow(n))
# @param {Integer[]} nums
# @return {Integer[][]}

def subsets(nums, i = 0)
  puts "call"
  return [[]] if nums.size == 0

  without_first_subset = subsets(nums[1..-1])

  without_first_subset + without_first_subset.map do |subset|
    puts "call - inside #{i += 1}"
    subset + [nums.first]
  end
end

#pp subsets([1,2,3,4,5,6])

# Iterative  O(2pow(n))  (1+2+4+8+16....)
def subsets2(nums, n = 0)
  result = [[]]

  nums.each do |num|

      len = result.size
      i = 0
      while i < len
          new_subset = result[i] + [num]
          result << new_subset
          i += 1
          n += 1
          p "each loop: #{result}"
      end
      p "---------- #{i}"
  end
  puts "total #{n}"
  result
end

pp subsets2([1,2,3,4,5])
