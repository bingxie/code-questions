# 方法一： recursive
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  is_mirror(root, root)
end

def is_mirror(t1, t2)
  return true if t1.nil? && t2.nil?
  return false if t1.nil? || t2.nil?

  t1.val == t2.val && is_mirror(t1.right, t2.left) && is_mirror(t1.left, t2.right)
end

# 方法二： Iterative
def is_symmetric(root)
  return true if root.nil?

  queue = [root.left, root.right]

  while queue.size > 0
    n1 = queue.shift
    n2 = queue.shift

    next if n1.nil? && n2.nil?  # 注意同时为nil的处理
    return false if n1.nil? || n2.nil?
    return false if n1.val != n2.val

    queue << n1.left
    queue << n2.right
    queue << n1.right
    queue << n2.left
  end

  true
end
