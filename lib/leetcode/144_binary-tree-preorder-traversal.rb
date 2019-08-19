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
def preorder_traversal(root)
  return [] if root.nil?

  stack = [root]
  results = []

  until stack.empty?
    current_node = stack.pop
    results.push current_node.val

    stack.push current_node.right if current_node.right  # 先把右节点放在栈下面，画图好理解
    stack.push current_node.left if current_node.left
  end
  results
end

root = TreeNode.new(1)
node1 = TreeNode.new(2)
node2 = TreeNode.new(3)
root.right = node1
node1.left = node2

p preorder_traversal(root) # [1,2,3]