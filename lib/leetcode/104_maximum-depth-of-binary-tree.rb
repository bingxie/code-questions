# Tags: #Binary Tree, #DFS

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
# Recursion
def max_depth(root)
  return 0 if root.nil?

  left_height = max_depth(root.left)
  right_height = max_depth(root.right)

  [left_height, right_height].max + 1 # 没进入一层都要加1
end

# Iteration
def max_depth2(root)
  return 0 if root.nil?

  max_depth = 0
  stack = []
  stack.push [root, 1]

  until stack.empty?
    node, depth = stack.pop

    max_depth = [depth, max_depth].max

    stack.push [node.left, depth + 1] if node.left
    stack.push [node.right, depth + 1] if node.right
  end

  max_depth
end

node1 = TreeNode.new(3)
node2 = TreeNode.new(9)
node3 = TreeNode.new(20)
node4 = TreeNode.new(15)
node5 = TreeNode.new(7)

node1.left = node2
node1.right = node3
node3.left = node4
node3.right = node5

p max_depth(node1)
p max_depth2(node1)

def max_depth3(node)
  return 0 if node.nil?

  max_depth = 0
  stack = [[node, 1]]

  until stack.empty?
    current_node, depth = stack.pop

    max_depth = [max_depth, depth].max

    stack.push([current_node.left, depth + 1]) if current_node.left
    stack.push([current_node.right, depth + 1]) if current_node.right
  end

  max_depth
end

p max_depth3(node1)
