# number of islands的变种

# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
  sizes = num_islands(grid)
  sizes.empty? ? 0 : sizes.max
end

def num_islands(grid)
  return [] if grid.empty?

  sizes = []

  0.upto(grid.size - 1) do |i| # (grid.size -1).times
    0.upto(grid.first.size - 1) do |j|
      if grid[i][j] == 1
        sizes.push bfs(i, j, grid)
      end
    end
  end

  sizes
end

def bfs(i, j, grid)
  size = 1
  directions = [[-1, 0], [0, -1], [1, 0], [0, 1]]

  queue = Queue.new
  queue.push([i, j]) # 也可以用两个queue，比如： row_queue, col_queue

  until queue.empty?
    row, col = queue.pop

    grid[row][col] = 0

    directions.each do |dr|
      new_r = row + dr[0]
      new_c = col + dr[1]

      if new_r >= 0 && new_c >= 0 && new_r < grid.size && new_c < grid.first.size && grid[new_r][new_c] == 1
        queue.push([new_r, new_c])
        grid[new_r][new_c] = '0' # mark as visited

        size += 1
      end
    end
  end

  size
end
