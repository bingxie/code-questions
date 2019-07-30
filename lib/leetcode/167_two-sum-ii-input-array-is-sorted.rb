# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  return [] if numbers.size < 2

  i = 0
  j = numbers.size - 1

  while i < j
      sum = numbers[i] + numbers[j]
      if sum == target
          return [i+1, j+1]
      elsif sum > target
          j -= 1
      else
          i += 1
      end
  end
end

numbers = [2,7,11,15]
target = 9
p two_sum(numbers, target) == [1, 2]