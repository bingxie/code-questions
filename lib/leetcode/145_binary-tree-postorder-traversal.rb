require_relative '../data_structures/binary_trees/binary_tree_builder'

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  return [] if root.nil?

  stack = [root]
  results = []
  until stack.empty?
    node = stack.pop
    results.unshift(node.val) if node.val # 从头上放

    stack.push node.left if node.left
    stack.push node.right if node.right
  end
  results
end

root = BinaryTreeBuilder.build([1,nil,2,nil, nil,3])
p root

p postorder_traversal(root) # [3,2,1]
