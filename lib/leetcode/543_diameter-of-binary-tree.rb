# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def diameter_of_binary_tree(root)
  return 0 if root.nil?
  @diameter = 0

  depth(root)

  @diameter
end

def depth(node)
  return 0 if node.nil?

  left_depth = depth(node.left)
  right_depth = depth(node.right)

  @diameter = [@diameter, left_depth + right_depth].max

  [left_depth, right_depth].max + 1
end
