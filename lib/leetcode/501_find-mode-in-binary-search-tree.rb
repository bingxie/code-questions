# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def find_mode(root)
  hash = Hash.new(0)

  dfs(root, hash)
  max = hash.values.max

  hash.select { |_k, v| v == max }.keys
end

def dfs(root, hash)
  if root
    hash[root.val] += 1
    dfs(root.left, hash)
    dfs(root.right, hash)
  end
end
