# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Boolean}
def has_path_sum(root, sum)
  return false if root.nil?

  sum -= root.val

  return sum.zero? if root.left.nil? && root.right.nil?

  has_path_sum(root.left, sum) || has_path_sum(root.right, sum)
end
