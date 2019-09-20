# Tags: Matrix, Graph, BFS

Node = Struct.new(:x, :y, :val, :depth)

# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  queue = Queue.new
  num_rows = grid.size
  num_columns = grid[0].size

  # 把所有的烂橘子都放到初始队列里面，深度为0
  grid.each_with_index do |row, i|
    row.each_with_index do |val, j|
      queue.push(Node.new(i, j, 2, 0)) if val == 2
    end
  end

  directions = [[-1, 0], [0, -1], [1, 0], [0, 1]]

  new_depth = 0
  until queue.empty?
    queue_size = queue.size

    queue_size.times do |_i|
      node = queue.pop

      new_depth = node.depth
      directions.each do |direction|
        new_x = node.x + direction[0]
        new_y = node.y + direction[1]

        next unless new_x >= 0 && new_x < num_rows &&
                    new_y >= 0 && new_y < num_columns &&
                    grid[new_x][new_y] == 1

        new_node = Node.new(new_x, new_y, 2, new_depth + 1)
        grid[new_x][new_y] = 2
        queue.push new_node
      end
    end
  end

  grid.each do |row|
    all_rotted = row.none? {|val| val == 1}
    return -1 unless all_rotted
  end
  new_depth
end

grid = [[2,1,1],[1,1,0],[0,1,1]]
p oranges_rotting(grid)  # 4

grid = [[2,1,1],[0,1,1],[1,0,1]]
p oranges_rotting(grid)  # -1

grid = [[0,2]]
p oranges_rotting(grid)  # 0

grid = [[0,1]]
p oranges_rotting(grid)  # -1

grid = [[1,2]]
p oranges_rotting(grid)  # 1

grid = [[0]]
p oranges_rotting(grid)  # 0

grid = [[1],[0]]
p oranges_rotting(grid)  # -1

grid = [[2,2,2,1,1]]
p oranges_rotting(grid)  # 2
