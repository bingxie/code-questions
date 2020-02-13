require_relative '../data_structures/binary_trees/binary_tree_builder'

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Float} target
# @return {Integer}
def closest_value(root, target)
  list = inorder(root, [])

  return list.first if list.size <= 1

  # 需要注意边界的情况，已经 等于 的情况
  return list.first if target <= list.first
  return list.last if target >= list.last

  list.each_cons(2) do |a, b|
    if target >= a && target <= b
      return (target - a) > (b - target) ? b : a
    end
  end
end

def inorder(root, result)
  return if root.nil?

  inorder(root.left, result)
  result.push root.val
  inorder(root.right, result)

  result
end
