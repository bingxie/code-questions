# Tags: Binary Search Tree, BST, recursion
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
# @return {Boolean}
def is_valid_bst(root, lower_bound = -Float::INFINITY, upper_bound = Float::INFINITY)
  if root.nil?
    true
  elsif root.val >= upper_bound || root.val <= lower_bound
    false
  else
    is_valid_bst(root.left, lower_bound, root.val) && # BST的问题，很多都是用递归调用解决
      is_valid_bst(root.right, root.val, upper_bound)
  end
end

def is_valid_bst2(node, lower_limit = nil, upper_limit = nil)
  return true if node.nil?

  return false if upper_limit && node.val >= upper_limit
  return false if lower_limit && node.val <= lower_limit

  is_valid_bst2(node.left, lower_limit, node.val) &&
    is_valid_bst2(node.right, node.val, upper_limit)
end

root = TreeNode.new(2)
node1 = TreeNode.new(1)
node2 = TreeNode.new(3)

root.left = node1
root.right = node2

p is_valid_bst(root)  # true
p is_valid_bst2(root)   # true

node3 = TreeNode.new(4)
node2.left = node3
p is_valid_bst(root)    # false
p is_valid_bst2(root)   # false
