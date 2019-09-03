def mine_sweeper(bomps, num_rows, num_cols)
  board = Array.new(num_rows) { Array.new(num_cols, 0) }  # 初始二维数组都为0

  bomps.each do |row, col|
    board[row][col] = -1

    (row - 1..row + 1).each do |r|
      (col - 1..col + 1).each do |c|
        board[r][c] += 1 if r >= 0 && r < num_rows && c >= 0 && c < num_cols && board[r][c] != -1
      end
    end
  end

  board
end

# mine_sweeper([[0, 2], [2, 0]], 3, 3) should return:
# [[0, 1, -1],
#  [1, 2, 1],
#  [-1, 1, 0]]

p mine_sweeper([[0, 2], [2, 0]], 3, 3)
