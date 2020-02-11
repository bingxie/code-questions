# Tags: #BFS, #DFS, #Graph, #Matrix
# @param {Character[][]} grid
# @return {Integer}

# DFS
def num_islands(grid)
  return 0 if grid.empty?

  count = 0

  0.upto(grid.size - 1) do |i|
    0.upto(grid.first.size - 1) do |j|
      if grid[i][j] == '1'
        dfs(i, j, grid) # dfs遍历所有 1 node
        count += 1
      end
    end
  end
  count
end

def dfs(i, j, grid)
  return if i < 0 || j < 0 || i >= grid.size || j >= grid.first.size || grid[i][j] == '0'

  grid[i][j] = '0' # visited mark to 0

  dfs(i - 1, j, grid)
  dfs(i, j - 1, grid)
  dfs(i + 1, j, grid)
  dfs(i, j + 1, grid)
end

grid = [%w[1 1 1 1 0], %w[1 1 0 1 0], %w[1 1 0 0 0], %w[0 0 0 0 0]]
pp grid
p num_islands(grid)

##########################################

# BFS
def num_islands2(grid)
  return 0 if grid.empty?

  count = 0

  0.upto(grid.size - 1) do |i| # (grid.size -1).times
    0.upto(grid.first.size - 1) do |j|
      if grid[i][j] == '1'
        bfs(i, j, grid)
        count += 1
      end
    end
  end
  count
end

def bfs(i, j, grid)
  directions = [[-1, 0], [0, -1], [1, 0], [0, 1]]

  queue = Queue.new
  queue.push([i, j]) # 也可以用两个queue，比如： row_queue, col_queue

  until queue.empty?
    row, col = queue.pop

    grid[row][col] = '0'

    directions.each do |dr|
      new_r = row + dr[0]
      new_c = col + dr[1]

      if new_r >= 0 && new_c >= 0 && new_r < grid.size && new_c < grid.first.size && grid[new_r][new_c] == '1'
        queue.push([new_r, new_c])
        grid[new_r][new_c] = '0' # mark as visited
      end
    end
  end
end

grid = [%w[1 1 1 1 0], %w[1 1 0 1 0], %w[1 1 0 0 0], %w[0 0 0 0 0]]
p num_islands2(grid)
