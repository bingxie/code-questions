# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  return 0 if grid.empty?

  count = 0

  0.upto(grid.size - 1) do |i|
    0.upto(grid.first.size - 1) do |j|
      if grid[i][j] == "1"
        dfs(i, j, grid)
        count += 1
      end
    end
  end
  count
end

def dfs(i, j, grid)
  return if i < 0 || j < 0 || i >= grid.size || j >= grid.first.size || grid[i][j] == "0"

  grid[i][j] = "0"

  dfs(i - 1, j, grid)
  dfs(i, j - 1, grid)
  dfs(i + 1, j, grid)
  dfs(i, j + 1, grid)
end

grid = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]
p num_islands(grid)