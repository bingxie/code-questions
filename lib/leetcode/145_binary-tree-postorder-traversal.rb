# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  return [] if root.nil?

  stack = [root]
  results = []
  until stack.empty?
    node = stack.pop
    results.unshift(node.val)

    stack.push node.left if node.left
    stack.push node.right if node.right
  end
  results
end

root = TreeNode.new(1)
node1 = TreeNode.new(2)
node2 = TreeNode.new(3)
root.right = node1
node1.left = node2

p postorder_traversal(root) # [3,2,1]