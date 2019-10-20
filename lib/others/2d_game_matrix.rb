# BFS Matrix 2d game

def find_legal_moves(board, position)
  results = []
  directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]

  directions.each do |x, y|
    new_r = position.first + x
    new_c = position.last + y

    if new_r >= 0 && new_c >= 0 && new_r < board.size && new_c < board.first.size && board[new_r][new_c] == 0
      results.push [new_r, new_c]
    end
  end
  results
end

board = [[0, 0, 0, -1, -1], [0, 0, -1, 0, 0], [0, -1, 0, -1, 0], [0, 0, -1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]

pp board

p find_legal_moves(board, [3,1])
p find_legal_moves(board, [5,3])
p find_legal_moves(board, [5,1])
