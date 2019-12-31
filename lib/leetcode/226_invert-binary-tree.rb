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
# Approach1: Iterative + Queue BFS
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

# Approach2: Recursive
def invert_tree2(root)
  return nil if root.nil?

  new_right = invert_tree(root.right)
  new_left = invert_tree(root.left)

  root.left = new_right
  root.right = new_left

  root
end
