# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left, @right = nil, nil
  end
end

def find_paths(root, path, paths, left, right)
  copy_path = path.dup

  if root
    mid = (left + right) / 2
    copy_path.push " " * mid + root.val

    if root.left.nil? && root.right.nil? # leaf node
      paths.push copy_path
    else
      find_paths(root.left, copy_path, paths, left, mid - 1)
      find_paths(root.right, copy_path, paths, mid + 1, right)
    end
  end
end

def max_depth2(root)
  return 0 if root.nil?

  [max_depth2(root.left), max_depth2(root.right)].max + 1
end

node1 = TreeNode.new('A')
node2 = TreeNode.new('B')
node3 = TreeNode.new('C')
node4 = TreeNode.new('D')
node5 = TreeNode.new('E')
node6 = TreeNode.new('F')

node1.left = node2
node1.right = node3
node2.left = node4
node2.right = node5
node3.left = node6

paths = []

height = max_depth2(node1)
find_paths(node1, [], paths, 0, 2**height - 1)

puts paths

