# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
  return nil if inorder.empty?

  root_node_val = postorder.last
  root_node_index = inorder.index(root_node_val)

  node = TreeNode.new(root_node_val)

  node.left = build_tree(inorder[0..root_node_index - 1], postorder[0..root_node_index - 1]) if root_node_index > 0

  if root_node_index < inorder.length - 1
    node.right = build_tree(inorder[root_node_index + 1..-1], postorder[root_node_index..postorder.size - 2])
  end

  node
end