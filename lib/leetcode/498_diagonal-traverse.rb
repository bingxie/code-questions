# 可以用于game of four中判断对角线上是否有四个同样颜色的。
# https://www.youtube.com/watch?v=2w3YtiPOEPc

# @param {Integer[][]} matrix
# @return {Integer[]}
def find_diagonal_order(matrix)
  return [] if matrix.empty? || matrix[0].empty?

  i = 0
  j = 0
  row_size = matrix.size
  col_size = matrix[0].size
  result = []

  total = row_size * col_size

  total.times do |_k|
    result.push matrix[i][j]

    if (i + j).even?
      if j == col_size - 1  # 换行
        i += 1
      elsif i == 0
        j += 1
      else # go up
        i -= 1
        j += 1
      end
    else # odd
      if i == row_size - 1
        j += 1
      elsif j == 0
        i += 1
      else # go down
        i += 1
        j -= 1
      end
    end
  end

  result
end

input = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

p find_diagonal_order(input)
