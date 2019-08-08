# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return nil if inorder.empty?

  root_node_val = preorder.first
  root_node_index = inorder.index(root_node_val)

  node = TreeNode.new(root_node_val)

  node.left = if root_node_index > 0

  if root_node_index < inorder.length - 1
    node.right = build_tree(preorder[root_node_index + 1..-1], inorder[root_node_index + 1..-1])
  end

  node
end
