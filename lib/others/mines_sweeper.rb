# beginner: 9*9 10 mines
# intermediate:  16*16  40 mines
# advanced: 16*30 99 mines

# 81: 2 (0, 1), 10 (1, 0) , 22,

class Board
  def initialize(row, col, mines)
    @grids = Array.new(row) { Array.new(col, 'E') }  # E代表空的没揭开的格子

    @mines = mines
    assign_mines(row, col)
  end

  def print
    @grids.each do |row|
      pp row
    end
  end

  private

  def assign_mines(row, col)
    total = row * col
    (0..total - 1).to_a.sample(@mines).each do |num|
      r = num / col
      c = num % col

      @grids[r][c] = 'M' # M代表mine
      assign_nums(r, c)
    end
  end

  def assign_nums(r, c)
    around_grids = find_around_grids(r, c)

    around_grids.each do |row, col|
      next if row < 0 || row > @grids.size - 1 || col < 0 || col > @grids[0].size - 1

      if @grids[row][col] == 'E'
        @grids[row][col] = '1'
      elsif @grids[row][col] != 'M'
        @grids[row][col] = (@grids[row][col].to_i + 1).to_s
      end
    end
  end

  def find_around_grids(r, c)
    [[r - 1, c - 1], [r - 1, c], [r - 1, c + 1], [r, c - 1], [r, c + 1], [r + 1, c - 1], [r + 1, c], [r + 1, c + 1]]
  end
end

Board.new(9, 9, 10).print

class Game
  def initialize(level)
    case level
    when 'beginner'
      @board = Board.new(9, 9, 10)
    when 'intermediate'
      @board = Board.new(16, 16, 40)
    when 'advanced'
      @board = Board.new(16, 30, 99)
    end
  end
end
