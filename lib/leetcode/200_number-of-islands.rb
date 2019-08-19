# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid) # DFS
  return 0 if grid.empty?

  count = 0

  0.upto(grid.size - 1) do |i|
    0.upto(grid.first.size - 1) do |j|
      if grid[i][j] == '1'
        dfs(i, j, grid)  # dfs遍历所有 1 node
        count += 1
      end
    end
  end
  count
end

def dfs(i, j, grid)
  return if i < 0 || j < 0 || i >= grid.size || j >= grid.first.size || grid[i][j] == '0'

  grid[i][j] = '0'

  dfs(i - 1, j, grid)
  dfs(i, j - 1, grid)
  dfs(i + 1, j, grid)
  dfs(i, j + 1, grid)
end

grid = [%w[1 1 1 1 0], %w[1 1 0 1 0], %w[1 1 0 0 0], %w[0 0 0 0 0]]
p num_islands(grid)

def num_islands2(grid)   # BFS
  return 0 if grid.empty?

  count = 0

  0.upto(grid.size - 1) do |i| # grid.size.times
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
  grid[i][j] = '0'
  directions = [[-1, 0], [0, -1], [1, 0], [0, 1]]

  queue = Queue.new
  queue.push([i, j])

  until queue.empty?
    r, c = queue.pop

    directions.each do |dr|
      new_r = r + dr[0]
      new_c = c + dr[1]

      if new_r >= 0 && new_c >= 0 && new_r < grid.size && new_c < grid.first.size && grid[new_r][new_c] == '1'
        queue.push([new_r, new_c])
        grid[new_r][new_c] = '0' # mark as visited
      end
    end
  end
end

grid = [%w[1 1 1 1 0], %w[1 1 0 1 0], %w[1 1 0 0 0], %w[0 0 0 0 0]]
p num_islands2(grid)
