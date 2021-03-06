require_relative '../data_structures/binary_trees/binary_tree_builder'

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q) # Recursion
  return p if find_node(p, q)

  return q if find_node(q, p)

  return lowest_common_ancestor(root.left, p, q) if find_node(root.left, p) && find_node(root.left, q)

  return lowest_common_ancestor(root.right, p, q) if find_node(root.right, p) && find_node(root.right, q)

  root
end

def lowest_common_ancestor2(root, p, q) # Iteration
  return nil if root.nil?

  return p if find_node(p, q)

  return q if find_node(q, p)

  node = root
  while node
    if find_node(node.left, p) && find_node(node.left, q)
      node = node.left
      next
    end

    if find_node(node.right, p) && find_node(node.right, q)
      node = node.right
      next
    end

    return node # 不能继续在同一子树找到，当前的节点就是
  end
end

def find_node(root, target) # O(n) recursive
  return false if root.nil?

  return true if root.val == target.val

  find_node(root.left, target) || find_node(root.right, target)
end

# https://www.youtube.com/watch?v=py3R23aAPCA
def lowest_common_ancestor3(root, p, q)
  return nil if root.nil?
  return root if root.val == p.val || root.val == q.val

  left_result = lowest_common_ancestor(root.left, p, q)
  right_result = lowest_common_ancestor(root.right, p, q)

  return right_result unless left_result
  return left_result unless right_result

  root
end

# use hash to keep the parents pointer mapping
require 'set'
def lowest_common_ancestor4(root, p, q)
  stack = []
  parents = {}

  parents[root] = nil
  stack.push root

  while !stack.empty? && (parents[p].nil? || parents[q].nil?)
    node = stack.pop

    if node.left
      parents[node.left] = node
      stack.push node.left
    end

    if node.right
      parents[node.right] = node
      stack.push node.right
    end
  end

  p_ancestors = Set.new
  while p
    p_ancestors.add p
    p = parents[p]
  end

  q = parents[q] until p_ancestors.include?(q)

  q
end

values = '3,5,1,6,2,0,8,null,null,7,4'
root = BinaryTreeBuilder.build(values)
BinaryTreeBuilder.print_tree(root)
pp BinaryTreeBuilder.postorder_traversal(root)

n1 = TreeNode.new(8)
n2 = TreeNode.new(6)

p lowest_common_ancestor(root, n1, n2).val # 3
p lowest_common_ancestor2(root, n1, n2).val # 3

n3 = TreeNode.new(5)
n4 = TreeNode.new(1)
p lowest_common_ancestor(root, n3, n4).val # 3
p lowest_common_ancestor2(root, n3, n4).val # 3

n5 = TreeNode.new(4)
p lowest_common_ancestor(root, n3, n5).val # 5
p lowest_common_ancestor2(root, n3, n5).val # 5
