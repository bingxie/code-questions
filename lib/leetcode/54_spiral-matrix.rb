# Tags: matrix, array
# Ruby: case/when, upto, downto, mod

# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return [] if matrix.empty?

  result = []

  # 学习对问题得抽象处理，边界变量的定义，以及方向的定义
  top = 0
  bottom = matrix.size - 1
  left = 0
  right = matrix.first.size - 1

  direction = 0

  while top <= bottom && left <= right
    case direction
    when 0
      left.upto(right) { |i| result.push matrix[top][i] }
      top += 1
    when 1
      top.upto(bottom) { |i| result.push matrix[i][right] }
      right -= 1
    when 2
      right.downto(left) { |i| result.push matrix[bottom][i] }
      bottom -= 1
    when 3
      bottom.downto(top) { |i| result.push matrix[i][left] }
      left += 1
    end

    direction = (direction + 1) % 4
  end

  result
end
