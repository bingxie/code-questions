require_relative '../data_structures/binary_trees/tree_node'
# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
  result = ""

  # 进行一个Pre-order的深度遍历
  stack = [root]

  until stack.empty?
    current_node = stack.pop

    if current_node.nil?
      result << "None,"
    else
      result << "#{current_node.value},"

      stack.push current_node.right_child
      stack.push current_node.left_child
    end
  end
  result
end
# "1,2,3,None,None,4,None,None,5,None,None,"

def serialize2(root, results = [])
  if root.nil?
    results.push('None')
    return
  end

  results.push(root.value)
  p "root value: #{results}"

  serialize2(root.left_child, results)
  serialize2(root.right_child, results)

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
  node.left_child = des_array(nodes)
  node.right_child = des_array(nodes)

  node
end

def r_serialize(root)
  return "None," if root.nil?

  [root.val, r_serialize(root.left_child), r_serialize(root.right_child)].flatten.join(',')
end

node5 = TreeNode.new(5)
node4 = TreeNode.new(4)
node3 = TreeNode.new(3)
node2 = TreeNode.new(2, left: node3, right: node4)
node1 = TreeNode.new(1, left: node2, right: node5)

p serialize(node1) == "1,2,3,None,None,4,None,None,5,None,None,"
p serialize2(node1)
# p serialize(nil) == "None,"

# tree_string = "1,2,3,None,None,4,None,None,5,None,None,"
# p deserialize(tree_string)
