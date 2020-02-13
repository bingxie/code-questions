# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class BinaryTreeBuilder
  # input: "1,2,5,3,null,null,null,null,4,null,null"
  def self.build(tree_string)
    arr = tree_string.split(',')

    return nil if arr.empty? || arr[0] == 'null'

    root = TreeNode.new(arr.shift.to_i)

    queue = [root]

    until queue.empty? || arr.empty?
      node = queue.shift

      left_val = arr.shift
      if left_val == 'null'
        node.left = nil
      elsif left_val
        left_node = TreeNode.new(left_val.to_i)
        node.left = left_node
        queue.push left_node
      end

      right_val = arr.shift
      if right_val == 'null'
        node.right = nil
      elsif right_val
        right_node = TreeNode.new(right_val.to_i)
        node.right = right_node
        queue.push right_node
      end
    end

    root
  end

  def self.print_tree(root)
    return [''] if root.nil?

    depth = max_depth(root)

    width = 2**(depth + 1)

    result = Array.new(depth) { Array.new(width) { '' } }

    queue = Queue.new
    queue.push [root, 0, 0, width - 1]

    until queue.empty?
      node, row, left, right = queue.pop
      col = left + (right - left) / 2

      result[row][col] = node.val.to_s

      queue.push([node.left, row + 1, left, col - 1]) if node.left
      queue.push([node.right, row + 1, col + 1, right]) if node.right
    end

    result.each do |line|
      puts line.join('.')
    end
  end

  def self.postorder_traversal(root)
    return [] if root.nil?

    stack = [root]
    results = []
    until stack.empty?
      node = stack.pop
      results.unshift(node.val) if node.val # 从头上放

      stack.push node.left if node.left
      stack.push node.right if node.right
    end
    results
  end

  private
  def self.max_depth(root) # Recursion
    return 0 if root.nil?

    left_height = max_depth(root.left)
    right_height = max_depth(root.right)

    [left_height, right_height].max + 1 # 没进入一层都要加1
  end
end
# require_relative '../data_structures/binary_trees/binary_tree_builder'

# root = BinaryTreeBuilder.build('1,2,5,3,null,null,null,null,4,null,null')
# BinaryTreeBuilder.print_tree root

# root = BinaryTreeBuilder.build('1,null,2,3')
# BinaryTreeBuilder.print_tree root

# 5,4,7,3,null,2,null,-1,null,9
# root = BinaryTreeBuilder.build('5,4,7,3,null,2,null,-1,null,9')
# BinaryTreeBuilder.print_tree root
