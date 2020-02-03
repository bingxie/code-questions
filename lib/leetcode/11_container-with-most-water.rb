# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  result = 0

  left = 0
  right = height.size - 1

  while left < right
    new_area = (right - left) * [height[left], height[right]].min
    result = [new_area, result].max

    if height[left] <= height[right]
      left += 1
    else
      right -= 1
    end
  end

  result
end

height = [1, 8, 6, 2, 5, 4, 8, 3, 7]

p max_area(height)
