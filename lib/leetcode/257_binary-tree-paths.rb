# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root)  #DFS recursion
  paths = []
  build_paths(root, "", paths)

  paths
end

def build_paths(node, path, paths)
  return if node.nil?

  path += node.val.to_s

  if node.left.nil? && node.right.nil?
    paths << path
  else
    path += '->'
    build_paths(node.left, path, paths)
    build_paths(node.right, path, paths)
  end
end

# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths2(root)  #DFS stack Iteration
  paths = []

  return paths if root.nil?

  stack = []
  stack.push([root, ""])

  until stack.empty?
    node, path = stack.pop
    path += node.val

    if node.left.nil? && node.right.nil?
      paths << path
    else
      stack.push([node.left, path + '->']) if node.left
      stack.push([node.right, path + '->']) if node.right
    end
  end
  paths
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

# puts binary_tree_paths(node1)

puts binary_tree_paths2(node1)