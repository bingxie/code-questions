def play_game(board, moves)
  player1_score = 0
  player2_score = 0

  queue = [board]

  until queue.empty?  # 其实就是一个BFS的问题，每一个中间结果放到queue中，然后继续进行

    current_board = queue.shift

    game_over = true

    moves.each do |move|
      new_board = execute_move(current_board, move) # 一定是current_board

      if new_board
        queue.push new_board
        game_over = false
      end
    end

    if game_over # no moves, game over
      if current_board[0] > current_board[-1] # first player win
        player1_score += 1
      else
        player2_score += 1
      end
    end
  end

  [player1_score, player2_score]
end

def execute_move(board, move)
  new_board = board.dup  # 后面要返回，注意要copy一下board
  new_board.each_with_index do |value, index|
    new_board[index] = value + move[index]
    return nil if new_board[index] < 0
  end
  p new_board
  new_board
end

board = [6, 4, 2, 4]
moves = [[-2, -2, 1, 0],
         [-4, -4, 0, 0],
         [0, 0, -2, -2]]

p play_game(board, moves) # [3, 2]