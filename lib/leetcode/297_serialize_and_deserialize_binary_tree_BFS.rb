require_relative '../data_structures/binary_trees/binary_tree_builder'
require_relative '../data_structures/binary_trees/tree_node'
# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
# DFS, pre-order, stack
def serialize_bfs(root)
  result = []

  queue = [root]

  until queue.empty?
    node = queue.shift

    if node.nil?
      result.push 'Null'
    else
      result.push node.val

      queue.push node.left
      queue.push node.right
    end
  end

  result.join(',')
end
# "1,2,5,3,Null,Null,Null,Null,4,Null,Null"

def deserialize_bfs(data)
  arr = data.split(',')

  return nil if arr.empty? || arr[0] == 'Null'

  root = TreeNode.new(arr.shift)

  queue = [root]

  until queue.empty?
    node = queue.shift

    left_val = arr.shift
    if left_val == 'Null'
      node.left = nil
    else
      left_node = TreeNode.new(left_val)
      node.left = left_node
      queue.push left_node
    end

    right_val = arr.shift
    if right_val == 'Null'
      node.right = nil
    else
      right_node = TreeNode.new(right_val)
      node.right = right_node
      queue.push right_node
    end
  end

  root
end


node5 = TreeNode.new(5)
node4 = TreeNode.new(4)
node3 = TreeNode.new(3)
node3.right = node4

node2 = TreeNode.new(2, left: node3)
node1 = TreeNode.new(1, left: node2, right: node5)

BinaryTreeBuilder.print_tree node1

p serialize_bfs(node1) # '1,2,5,3,Null,Null,Null,Null,4,Null,Null'

BinaryTreeBuilder.print_tree deserialize_bfs(serialize_bfs(node1))
