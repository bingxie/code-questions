require_relative '../data_structures/queues/heap.rb'

class KthLargest
  def initialize(k, nums)
    @k = k
    @nums = nums
    @min_heap = Heap.new(:min)

    @nums.each do |num|
      add_num(num)
    end
  end

  def add(val)
    add_num(val)
    @min_heap.peek
  end

  private

  def add_num(num)
    @min_heap.push(num)

    @min_heap.pop if @min_heap.size > @k
  end
end

k = 3
arr = [4, 5, 8, 2]

obj = KthLargest.new(k, arr)
p obj.add(3) # 4
p obj.add(5) # 5
p obj.add(10) # 5
p obj.add(9) # 8
p obj.add(4) # 8
