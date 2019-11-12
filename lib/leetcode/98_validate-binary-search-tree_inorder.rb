# Tags: BST Binary Search Tree, In-Order
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  inorder_nodes = in_order(root)

  inorder_nodes.each_with_index do |value, index|
    return false if inorder_nodes[index + 1] && value > inorder_nodes[index + 1]
  end

  true
end

def in_order(node, result = [])
  return [] if node.nil?

  in_order(node.left, result) if node.left

  result << node.val

  in_order(node.right, result) if node.right

  result
end

#########################

def is_valid_bst2(root)  # save result space, use stack, compare during traversal
  return true if root.nil?

  stack = []
  previous = nil

  node = root

  while !stack.empty? || node
    while node
      stack.push node

      node = node.left
    end

    node = stack.pop

    return false if previous && node.val <= previous
    previous = node.val

    node = node.right
  end

  true
end

root = TreeNode.new(2)
node1 = TreeNode.new(1)
node2 = TreeNode.new(3)

root.left = node1
root.right = node2

results = []

p in_order(root, results)

p is_valid_bst(root)
