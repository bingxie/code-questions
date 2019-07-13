# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  results = in_order(root)
  results.each_with_index do |value, index|
    return false if results[index + 1] && value > results[index + 1]
  end
  return true
end

def in_order(node, result = [])
  return nil if node.nil?

  if node.left
    in_order(node.left, result)
  end
  result << node.val

  if node.right
    in_order(node.right, result)
  end

  return result
end

root = TreeNode.new(2)
node1 = TreeNode.new(1)
node2 = TreeNode.new(3)

root.left = node1
root.right = node2

results = []

p in_order(root, results)

p is_valid_bst(root)
