# Binary Tree, DFS

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root) # Recursion
  return 0 if root.nil?

  left_height = max_depth(root.left)
  right_height = max_depth(root.right)

  [left_height, right_height].max + 1 # 没进入一层都要加1
end

def print_tree(root)
  return [''] if root.nil?

  depth = max_depth(root)

  width = 2**depth - 1

  result = Array.new(depth) { Array.new(width) { '' } }

  queue = Queue.new
  queue.push [root, 0, 0, width - 1]

  until queue.empty?
    node, i, left, right = queue.pop
    j = left + (right - left) / 2

    result[i][j] = node.val.to_s

    queue.push([node.left, i + 1, left, j - 1]) if node.left
    queue.push([node.right, i + 1, j + 1, right]) if node.right
  end

  result
end

node1 = TreeNode.new(1)
node2 = TreeNode.new(2)
node3 = TreeNode.new(3)
node4 = TreeNode.new(4)
node1.left = node2
node1.right = node3
node2.right = node4

p max_depth(node1)

p print_tree(node1)
