Node = Struct.new(:x, :y, :val)

# Time complexity: O(numRows * numColumns), the worst case to try every node.
# Space complexity : O(numRows * numColumns)
def removeObstacle(numRows, numColumns, lot)
  return -1 if lot.nil?

  queue = Queue.new
  queue.push(Node.new(0, 0, lot[0][0])) # Push the start node to queue

  directions = [[-1, 0], [0, -1], [1, 0], [0, 1]]

  total_distance = 0

  until queue.empty?   # BFS?
    queue_size = queue.size

    queue_size.times do |_i|
      node = queue.pop
      return total_distance if node.val == 9  # find target

      # mark as visited
      lot[node.x][node.y] = -1

      directions.each do |direction|
        new_x = node.x + direction[0]
        new_y = node.y + direction[1]

        next unless new_x >= 0 && new_x < numRows &&
                    new_y >= 0 && new_y < numColumns &&
                    lot[new_x][new_y] > 0

        new_node = Node.new(new_x, new_y, lot[new_x][new_y])
        queue.push new_node
      end
    end

    total_distance += 1
  end

  -1
end

lot = [[1, 0, 0], [1, 0, 0], [1, 9, 0]]
pp removeObstacle(3, 3, lot) # 3

lot = [[1, 1, 1, 1], [0, 1, 1, 1], [0, 1, 0, 1], [1, 1, 9, 1], [0, 0, 1, 1]]
pp removeObstacle(5, 4, lot) # 5
