# https://www.interviewcake.com/question/ruby/find-duplicate-optimize-for-space


# @param {Integer[]} nums
# @return {Integer}
def find_duplicate_number(nums)
  return nil if nums&.size == 0
  sorted_nums = nums.sort                    # sort first O(log(n))
  sorted_nums.each_with_index do |num, index|
    return num if num == sorted_nums[index + 1]  # O(n)
  end
end


p find_duplicate_number([1,3,4,2,2])

p find_duplicate_number([3,1,3,4,2])

# Floyd's Tortoise and Hare (Cycle Detection)
def find_duplicate_number2(nums)
  slow = nums[0]
  fast = nums[nums[0]]

  # Find the intersection point of the two runners.
  while fast != slow
    slow = nums[slow]
    fast = nums[nums[fast]]
  end

  slow = 0
  while fast != slow
    slow = nums[slow]
    fast = nums[fast]
  end

  slow
end

p find_duplicate_number2([3,1,3,4,2])
p find_duplicate_number2([1,3,4,2,2])