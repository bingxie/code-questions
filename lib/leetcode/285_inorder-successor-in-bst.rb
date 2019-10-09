# Tags: Binary Tree, BST, BFS, DFS
require_relative '../data_structures/binary_trees/binary_tree_builder'


# @param {TreeNode} root
# @param {TreeNode} p
# @return {TreeNode}

def inorder_successor(root, p)
  stack = []

  current_node = root
  found = false
  while current_node || !stack.empty?
    while current_node
      stack.push current_node
      current_node = current_node.left
    end

    current_node = stack.pop
    return current_node.val if found

    found = true if current_node.val == p.val

    current_node = current_node.right
  end

  nil
end

values = [2,1,3]
root = BinaryTreeBuilder.build(values)
BinaryTreeBuilder.print_tree(root)

p inorder_successor(root, TreeNode.new(1))

values = [5,3,6,2,4,nil,nil,1]
root = BinaryTreeBuilder.build(values)
BinaryTreeBuilder.print_tree(root)
p inorder_successor(root, TreeNode.new(6))
