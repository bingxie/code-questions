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
def is_valid_bst(root, lower_bound = -Float::INFINITY, upper_bound = Float::INFINITY)
  if root.nil?
    return true
  elsif root.val >= upper_bound || root.val <= lower_bound
    return false
  else
    is_valid_bst(root.left, lower_bound, root.val) &&
    is_valid_bst(root.right, root.val, upper_bound)
  end
end

# Greedy - DFS solution

# Divide and Conquer - Recursion solution

root = TreeNode.new(2)
node1 = TreeNode.new(1)
node2 = TreeNode.new(3)

root.left = node1
root.right = node2

p is_valid_bst(root)

node3 = TreeNode.new(4)
node2.left = node3
p is_valid_bst(root)
