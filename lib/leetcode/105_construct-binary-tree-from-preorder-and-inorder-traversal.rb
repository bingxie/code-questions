# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
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

  node.left = build_tree(preorder[1..root_node_index], inorder[0..root_node_index - 1]) if root_node_index > 0

  if root_node_index < inorder.length - 1
    node.right = build_tree(preorder[root_node_index + 1..-1], inorder[root_node_index + 1..-1])
  end

  node
end

def inorder_traversal_r(root, result = [])
  return result if root.nil?

  inorder_traversal_r(root.left, result) if root.left

  result.push root.val

  inorder_traversal_r(root.right, result) if root.right

  result
end

def preorder_traversal_r(root, result = [])
  return if root.nil?

  result.push root.val
  preorder_traversal_r(root.left, result) if root.left
  preorder_traversal_r(root.right, result) if root.right

  result
end

def inorder_traversal_i(root)
  result = []
  stack = []

  current_node = root
  while current_node || !stack.empty?
    while current_node
      stack.push current_node
      current_node = current_node.left
    end

    current_node = stack.pop
    result << current_node.val

    current_node = current_node.right
  end

  result
end

preorder = [3, 9, 20, 15, 7]

inorder = [9, 3, 15, 20, 7]

new_tree = build_tree(preorder, inorder)

p preorder_traversal_r(new_tree)
p inorder_traversal_r(new_tree)
p inorder_traversal_i(new_tree)
