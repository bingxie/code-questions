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

    if p.val > parent_val && q.val > parent_val   # 根据BST的特性，可以选择左子树或者右子树
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

# 我自己的想出来实现的方法
def lowest_common_ancestor3(root, p, q)
  return nil if root.nil?

  return lowest_common_ancestor(root, q, p) if p.val > q.val

  return root if root.val > p.val && root.val < q.val

  return p if root.val == p.val
  return q if root.val == q.val

  lowest_common_ancestor(root.left, p, q) || lowest_common_ancestor(root.right, p, q)
end

values = '6,2,8,0,4,7,9,null,null,3,5'
root = BinaryTreeBuilder.build(values)
pn = TreeNode.new(2)
qn = TreeNode.new(8)
p lowest_common_ancestor(root, pn, qn).val # 6
p lowest_common_ancestor2(root, pn, qn).val # 6

pn = TreeNode.new(2)
qn = TreeNode.new(4)
p lowest_common_ancestor(root, pn, qn).val # 2
p lowest_common_ancestor2(root, pn, qn).val # 2
