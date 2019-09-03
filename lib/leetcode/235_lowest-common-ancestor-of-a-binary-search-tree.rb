# Tags: Binary Search Tree, BST
require_relative '../data_structures/binary_trees/binary_tree_builder'

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q) # Iterative Approach
  node = root
  while node
    parent_val = node.val

    if p.val > parent_val && q.val > parent_val
      node = node.right
    elsif p.val < parent_val && q.val < parent_val
      node = node.left
    else
      return node
    end
  end
end

def lowest_common_ancestor2(root, p, q) # Recursive Approach
  parent_val = root.val

  if p.val > parent_val && q.val > parent_val
    lowest_common_ancestor2(root.right, p, q)
  elsif p.val < parent_val && q.val < parent_val
    lowest_common_ancestor2(root.left, p, q)
  else
    return root
  end
end

values = [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5]
root = BinaryTreeBuilder.build(values)
pn = TreeNode.new(2)
qn = TreeNode.new(8)
p lowest_common_ancestor(root, pn, qn).val # 6
p lowest_common_ancestor2(root, pn, qn).val # 6

pn = TreeNode.new(2)
qn = TreeNode.new(4)
p lowest_common_ancestor(root, pn, qn).val # 2
p lowest_common_ancestor2(root, pn, qn).val # 2
