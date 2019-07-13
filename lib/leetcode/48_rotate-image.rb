# 一行代码的ruby解决方案，可以看出ruby的表达能力很强，代码非常简洁，而且可读性也很高
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate2(matrix)
  matrix.replace(matrix.reverse.transpose)
end

# Rotating clockwise equals flipping diagonal then flipping horizontal.
def rotate(matrix)
  size = matrix.size
  max_index = size - 1

  # Flip diagonal
  size.times do |i|   # O(n*n)
    (i..max_index).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end

  pp matrix

  # Flip horizontal
  size.times do |i|
    (size / 2).times do |j|
      matrix[i][j], matrix[i][max_index - j] = matrix[i][max_index - j], matrix[i][j]
    end
  end
end

matrix = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]
rotate(matrix)
pp matrix