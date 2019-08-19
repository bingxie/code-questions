# Topic: Array
# @param {Character[][]} board
# @return {Integer}
def num_rook_captures(board)
  rook_row, rook_col = find_rook(board)

  count = 0

  directions = [[-1, 0], [0, 1], [1, 0], [0, -1]]

  directions.each do |row, col|
    new_row = row + rook_row
    new_col = col + rook_col

    while new_row >= 0 && new_row < board.length && new_col >= 0 && new_col < board.length
      break if board[new_row][new_col] == 'B'

      if board[new_row][new_col] == 'p'
        count += 1
        break
      end

      new_row += row
      new_col += col
    end
  end

  count
end

def find_rook(board)
  board.size.times do |i|
    board.first.size.times do |j|
      return [i, j] if board[i][j] == "R"
    end
  end
end

board = [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","R",".",".",".","p"],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]

p find_rook(board)

p num_rook_captures(board)