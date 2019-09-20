
class GameOfDrawdown
  STEPS = [[-2, -2, 1, 0], [-4, -4, 0, 0], [0, 0, -2, -2]]

  attr_reader :board
  def initialize(board)
    @board = board
    @player1_score = 0
    @player2_score = 0
  end

  def move(current_board, step)
    new_board = current_board.dup

    new_board.each_with_index do |val, index|
      new_val = val + step[index]
      return false if new_val < 0

      new_board[index] = new_val
    end

    new_board
  end

  def run
    queue = Queue.new
    queue.push(board)

    until queue.empty?
      current_board = queue.pop
      game_over = true  # game over: can not move

      STEPS.each do |step|
        new_board = move(current_board, step)

        if new_board  # continue move
          queue.push(new_board)
          game_over = false
        end
      end

      add_score(current_board) if game_over
    end
  end

  def add_score(current_board)
    player1_stones = current_board.first
    player2_stones = current_board.last

    if player1_stones > player2_stones
      @player1_score += 1
    else
      @player2_score += 1
    end
  end

  def result
    [@player1_score, @player2_score]
  end
end

board = [6, 4, 2, 4]

# 1. Check winning condition
game = GameOfDrawdown.new(board)
game.run
p game.result
