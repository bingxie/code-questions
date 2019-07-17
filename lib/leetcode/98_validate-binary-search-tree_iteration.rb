# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  node_and_bounds_stack = []
  node_and_bounds_stack.push [root, -Float::INFINITY, Float::INFINITY]

  until node_and_bounds_stack.empty?
    node, lower_bound, upper_bound = node_and_bounds_stack.pop

    return false if node.val <= lower_bound || node.val >= upper_bound

    node_and_bounds_stack.push [node.left, lower_bound, node.val] if node.left
    node_and_bounds_stack.push [node.right, node.val, upper_bound] if node.right
  end

  return true
end

# Greedy - DFS solution

# Divide and Conquer - Recursion solution

root = TreeNode.new(2)
node1 = TreeNode.new(1)
node2 = TreeNode.new(3)

root.left = node1
root.right = node2

results = []

p is_valid_bst(root)
