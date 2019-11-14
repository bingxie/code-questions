# @param {Integer[]} height
# @return {Integer}
def trap(height)
  left = 0
  right = height.size - 1

  result = 0
  left_max = 0
  right_max = 0
  while left < right
    if height[left] < height[right]
      height[left] >= left_max ? left_max = height[left] : result += (left_max - height[left])
      left += 1
    else
      height[right] >= right_max ? right_max = height[right] : result += (right_max - height[right])
      right -= 1
    end
  end

  result
end

height = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
p trap(height)
