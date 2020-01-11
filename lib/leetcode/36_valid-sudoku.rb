require 'set'

def is_valid_sudoku(board)
  boxes = Array.new(3) { Array.new(3) { Set.new } }
  cols = Array.new(9) { Set.new }
  rows = Array.new(9) { Set.new }

  (0...board.length).each do |row|
    (0...board[0].length).each do |col|
      char = board[row][col]
      next if char == '.'

      return false if !boxes[row / 3][col / 3].add?(char) || !rows[row].add?(char) || !cols[col].add?(char) || !('1'..'9').cover?(char)
    end
  end

  true
end
