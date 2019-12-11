# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Boolean}

# DFS recurisive:
def has_path_sum(root, sum)
  return false if root.nil?

  sum -= root.val

  return sum.zero? if root.left.nil? && root.right.nil?

  has_path_sum(root.left, sum) || has_path_sum(root.right, sum)
end

# DFS preorder, iterative, stack
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Boolean}
def has_path_sum2(root, sum)
  return false if root.nil?

  stack = [[root, sum - root.val]]

  until stack.empty?
    node, current_sum = stack.pop

    return true if node.left.nil? && node.right.nil? && current_sum == 0

    stack.push [node.right, current_sum - node.right.val] if node.right

    stack.push [node.left, current_sum - node.left.val] if node.left
  end

  false
end
