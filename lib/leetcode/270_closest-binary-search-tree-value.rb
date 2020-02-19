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

  # 需要注意边界的情况，以及 等于 的情况
  return list.first if target < list.first
  return list.last if target > list.last

  list.each_cons(2) do |a, b|
    if target >= a && target <= b
      return (target - a) > (b - target) ? b : a
    end
  end
end

def closest_value2(root, target)
  list = inorder(root, [])

  return list.first if list.size <= 1

  list.min { |a, b| (a - target).abs <=> (b - target).abs }
end

def inorder(root, result)
  return if root.nil?

  inorder(root.left, result)
  result.push root.val
  inorder(root.right, result)

  result
end

# 改进的版本，用iterative的inorder方法，一遍遍历，一遍比较

def closest_value3(root, target)
  stack = []

  prev = -Float::INFINITY
  node = root

  while !stack.empty?() || node
    while node
      stack.push node
      node = node.left
    end

    node = stack.pop

    if prev <= target && target < node.val
      return (prev - target).abs < (node.val - target).abs ? prev : node.val
    end

    prev = node.val
    node = node.right
  end

  prev
end

# 第三种方法，参见javascript的版本
