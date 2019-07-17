# iteratively

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
def inorder_traversal(root)
  result = []
  stack = []

  current_node = root
  while current_node || !stack.empty? do
    while current_node do
      stack.push current_node
      current_node = current_node.left
    end

    current_node = stack.pop
    result << current_node.val

    current_node = current_node.right
  end

  result
end

root = TreeNode.new(2)
node1 = TreeNode.new(1)
node2 = TreeNode.new(3)

root.left = node1
root.right = node2

p inorder_traversal(root)