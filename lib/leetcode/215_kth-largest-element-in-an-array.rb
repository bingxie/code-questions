require_relative '../data_structures/queues/heap.rb'

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  return nil if nums&.size < k

  pq = Heap.new(:min)

  nums.each do |num|
    pq.push(num)
    if pq.size > k
      pq.pop
    end
  end

  pq.pop
end

# Quickselect solution
def find_kth_largest2(nums, k)
  loop do
    pivot = nums.delete_at(rand(nums.length))

    large_part, small_part = nums.partition {|num| num > pivot} # like quicksort and quickselect partition

    return pivot if k == large_part.size + 1

    if k < large_part.size + 1
      nums = large_part
    else
      k = k - large_part.length - 1 # 1 for pivot
      nums = small_part
    end
  end
end

p find_kth_largest([3,2,1,5,6,4], 2)  # 5
p find_kth_largest([3,2,3,1,2,4,5,5,6], 4) # 4

p find_kth_largest2([3,2,1,5,6,4], 2)  # 5
p find_kth_largest2([3,2,3,1,2,4,5,5,6], 4) # 4