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
def max_depth(root)  # Recursion
  return 0 if root.nil?

  left_height = max_depth(root.left)
  right_height = max_depth(root.right)

  [left_height, right_height].max + 1
end

def max_depth2(root)  # Iteration
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