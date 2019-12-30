# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
  return nil if root.nil?

  queue = [root]

  while queue.size > 0
    node = queue.shift

    temp = node.left
    node.left = node.right
    node.right = temp

    queue.push node.left if node.left
    queue.push node.right if node.right
  end

  root
end
