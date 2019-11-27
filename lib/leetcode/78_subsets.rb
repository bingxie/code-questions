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

def subsets4(nums)
  find_subsets(nums, 0, [])
end

def find_subsets(nums, start, pre_result)
  result = [pre_result]

  (start...nums.size).each do |index|
    result += find_subsets(nums, index + 1, pre_result + [nums[index]])
  end

  result
end

pp subsets4([1,2,3])

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

#pp subsets2([1,2,3,4,5])

def subsets3(nums)
  results = [[]]

  nums.each do |num|
    puts "each loop: results #{results}"
    results += results.map { |result| result + [num]}
  end
  results
end

# p subsets3([1,2,3])
