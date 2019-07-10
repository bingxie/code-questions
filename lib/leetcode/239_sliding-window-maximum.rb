# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  return [] if nums.nil? or nums.empty?

  return nums if k == 1

  queue = []

  k.times do |i|
    enqueue(queue, nums[i], k)
  end

  results = [queue[0]]  # first round result

  nums[k..-1].each do |num|
    enqueue(queue, num, k)
    results << queue[0]
  end

  results
end

def enqueue(queue, num, k)
  if
    queue.clear
  end

  current_bigest = queue.first
  if queue.size == k || (current_bigest && current_bigest < num)
    queue.clear
  end

  queue.push num
end

nums = [1,3,-1,-3,5,3,6,7]
k = 3
pp max_sliding_window(nums, k) # [3,3,5,5,6,7]

nums = [7,2,4]
k = 2
pp max_sliding_window(nums, k) # [7,4]