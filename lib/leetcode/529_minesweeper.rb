# @param {Character[][]} board
# @param {Integer[]} click
# @return {Character[][]}
def update_board(board, click)
  c_row, c_col = click

  return board if c_row < 0 || c_row >= board.size || c_col < 0 || c_col >= board.first.size

  if board[c_row][c_col] == 'M'
    board[c_row][c_col] = 'X' # boom, game over
    return board
  end

  if board[c_row][c_col] == 'E'
    board[c_row][c_col] = 'B'

    boom_count = count_booms(board, click)

    if boom_count == 0
      find_around_grids(c_row, c_col).each do |position|
        board = update_board(board, position)
      end
    else
      board[c_row][c_col] = boom_count.to_s
    end
  end

  board
end

def count_booms(board, click)
  row, col = click
  count = 0

  find_around_grids(row, col).each do |r, c|
    unless r >= board.size || c >= board.first.size || r < 0 || c < 0
      count += 1 if board[r][c] == 'M'
    end
  end

  count
end

def find_around_grids(r, c)
  [[r - 1, c - 1], [r - 1, c], [r - 1, c + 1], [r, c - 1], [r, c + 1], [r + 1, c - 1], [r + 1, c], [r + 1, c + 1]]
end

board = [%w[E E E E E], %w[E E M E E], %w[E E E E E], %w[E E E E E]]
click = [3, 0]

pp update_board(board, click)
