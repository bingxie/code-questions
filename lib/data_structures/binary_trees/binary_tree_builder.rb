# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class BinaryTreeBuilder
  def self.build(values)
    root = TreeNode.new(values.first)

    subtree(0, root, values.size, values)

    root
  end

  def self.print_tree(root)
    return [''] if root.nil?

    depth = max_depth(root)

    width = 2**depth - 1

    result = Array.new(depth) { Array.new(width) { '' } }

    queue = Queue.new
    queue.push [root, 0, 0, width - 1]

    until queue.empty?
      node, row, left, right = queue.pop
      col = left + (right - left) / 2

      result[row][col] = node.val.to_s

      queue.push([node.left, row + 1, left, col - 1]) if node.left
      queue.push([node.right, row + 1, col + 1, right]) if node.right
    end

    result.each do |line|
      puts line.join('-')
    end
  end

  def self.postorder_traversal(root)
    return [] if root.nil?

    stack = [root]
    results = []
    until stack.empty?
      node = stack.pop
      results.unshift(node.val) if node.val # 从头上放

      stack.push node.left if node.left
      stack.push node.right if node.right
    end
    results
  end

  private

  def self.subtree(index, root, size, values)
    # return if index > size

    left_node_index = index * 2 + 1
    right_node_index = index * 2 + 2

    if left_node_index < size
      root.left = TreeNode.new(values[left_node_index])
      subtree(left_node_index, root.left, size, values)
    end

    if right_node_index < size
      root.right = TreeNode.new(values[right_node_index])
      subtree(right_node_index, root.right, size, values)
    end
  end

  def self.max_depth(root) # Recursion
    return 0 if root.nil?

    left_height = max_depth(root.left)
    right_height = max_depth(root.right)

    [left_height, right_height].max + 1 # 没进入一层都要加1
  end
end

# values = [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5]
# root = BinaryTreeBuilder.build(values)
# pp root
# pp root.left.val
# pp root.right.val

# pp root.left.left.val
# pp root.left.right.val

# pp root.left.right.left.val
# pp root.left.right.right.val
