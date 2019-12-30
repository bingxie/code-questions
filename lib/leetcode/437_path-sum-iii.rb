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
# @return {Integer}
def path_sum(root, sum)
  return 0 if root.nil?

  dfs(root, sum) + path_sum(root.left, sum) + path_sum(root.right, sum)
end

def dfs(root, sum)
  count = 0

  return 0 if root.nil?

  count += 1 if root.val == sum

  new_sum = sum - root.val
  count += dfs(root.left, new_sum)
  count += dfs(root.right, new_sum)

  return count
end
