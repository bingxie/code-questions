# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Preorder, Recursion
# @param {TreeNode} t1
# @param {TreeNode} t2
# @return {TreeNode}
def merge_trees(t1, t2)
  return t2 if t1.nil?
  return t1 if t2.nil?

  t1.val += t2.val

  t1.left = merge_trees(t1.left, t2.left)
  t1.right = merge_trees(t1.right, t2.right)

  return t1
end

# Iterative Method
def merge_trees2(t1, t2)
  return t2 if t1.nil?

  stack = []
  stack.push [t1, t2]

  while stack.size > 0
    n1, n2 = stack.pop

    next if n1.nil? || n2.nil?

    n1.val += n2.val

    if n1.left.nil?
      n1.left = n2.left
    else
      stack.push [n1.left, n2.left]
    end

    if n1.right.nil?
      n1.right = n2.right
    else
      stack.push [n1.right, n2.right]
    end
  end

  t1
end
