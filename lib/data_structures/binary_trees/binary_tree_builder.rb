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
