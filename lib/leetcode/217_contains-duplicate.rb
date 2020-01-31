require 'set'
# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  set = Set.new

  nums.each do |num|
    return true unless set.add?(num)
  end

  false
end

p contains_duplicate([1,2,3,1])
p contains_duplicate([1,2,3,4])

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate2(nums)
  nums.uniq.size != nums.size
end
