# Tags: BST, recursion

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {TreeNode}
def trim_bst(root, l, r)
  return nil if root.nil?

  if root.val >= l && root.val <= r
    root.left = trim_bst(root.left, l, r)
    root.right = trim_bst(root.right, l, r)
  elsif root.val < l
    root = trim_bst(root.right, l, r)
  elsif root.val > r
    root = trim_bst(root.left, l, r)
  end

  root
end
