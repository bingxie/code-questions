require 'spec_helper'

RSpec.describe BinaryTree do
  it '' do
    node = TreeNode.new(1)
    node3 = TreeNode.new(9)
    node4 = TreeNode.new(11)
    node2 = TreeNode.new(10, left: node3, right: node4)

    root = TreeNode.new(5, left: node, right: node2)

    tree = BinaryTree.new(root)

    p tree.search(10, root)
  end
end
