require_relative '../data_structures/binary_trees/binary_tree_builder'
require_relative '../data_structures/binary_trees/tree_node'
# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
# DFS, pre-order, stack
def serialize(root)
  result = ''

  # 进行一个Pre-order的深度遍历
  stack = [root]

  until stack.empty?
    current_node = stack.pop

    if current_node.nil?
      result << 'None,'
    else
      result << "#{current_node.val},"

      stack.push current_node.right
      stack.push current_node.left
    end
  end

  result
end
# "1,2,3,None,None,4,None,None,5,None,None,"

# DFS, pre-order, recursion
def serialize2(root, results = [])
  if root.nil?
    results.push('None')
    return
  end

  results.push(root.val)

  serialize2(root.left, results)
  serialize2(root.right, results)

  results.join(',')
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
  string_array = data.split(',')
  des_array(string_array)
end

def des_array(nodes)
  val = nodes.shift

  return nil if val == 'None'

  node = TreeNode.new(val)
  node.left = des_array(nodes)
  node.right = des_array(nodes)

  node
end

def r_serialize(root)
  return 'None,' if root.nil?

  [root.val, r_serialize(root.left), r_serialize(root.right)].flatten.join(',')
end

node5 = TreeNode.new(5)
node4 = TreeNode.new(4)
node3 = TreeNode.new(3)
node2 = TreeNode.new(2, left: node3, right: node4)
node1 = TreeNode.new(1, left: node2, right: node5)

p serialize(node1) == '1,2,3,None,None,4,None,None,5,None,None,'
p serialize2(node1)
# p serialize(nil) == "None,"

# tree_string = "1,2,3,None,None,4,None,None,5,None,None,"
# p deserialize(tree_string)
puts '----------------------'

# 非常精炼的DFS的方法，树的问题，关注当前的节点
def serialize3(root)
  return 'X' if root.nil?

  left_str = serialize3(root.left)
  right_str = serialize3(root.right)

  "#{root.val},#{left_str},#{right_str}"
end

def deserialize3(string)
  queue = string.split(',')
  deserialize3_helper(queue)
end

def deserialize3_helper(queue)
  val = queue.shift

  return nil if val == 'X'

  node = TreeNode.new(val)

  node.left = deserialize3_helper(queue)
  node.right = deserialize3_helper(queue)

  node
end

p serialize3(node1)
BinaryTreeBuilder.print_tree deserialize3(serialize3(node1))
