require 'set'

# Iterative  o(n*n)
def subsets_with_dup(nums)
  result = [[]]
  set = Set.new

  nums.sort.each do |num|
      length = result.size
      i = 0
      while i < length
          new_subset = result[i] + [num]
          result << new_subset if set.add?(new_subset)
          i += 1
      end
  end
  result
end

pp subsets_with_dup([1,2,2])

pp subsets_with_dup([4,4,4,1,4])  #[[],[1],[1,4],[1,4,4],[1,4,4,4],[1,4,4,4,4],[4],[4,4],[4,4,4],[4,4,4,4]]
