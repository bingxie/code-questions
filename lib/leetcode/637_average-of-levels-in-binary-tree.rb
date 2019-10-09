# Tags: Binary Tree, BST, BFS, DFS
require_relative '../data_structures/binary_trees/binary_tree_builder'

# DFS
def average_of_levels_dfs(root)
  result = {}
  dfs_levels(root, result)

  result.values.map { |sum, count| sum / count.to_f }
end

# 9 [3, 9] 1
# 20 [3, 14.5] 1
# 15 [3, 14.5, 15] 2
def dfs_levels(node, result, depth = 0)
  return if node.nil?

  #puts "#{node.val} #{result} #{depth}"

  if result[depth].nil?
    result[depth] = [node.val.to_i, 1]
  else
    result[depth] = [(result[depth].first + node.val.to_i), result[depth].last + 1]
  end

  dfs_levels(node.left, result, depth + 1)
  dfs_levels(node.right, result, depth + 1)
end

# BFS
def average_of_levels_bfs(root)
  return [] if root.nil?

  result = []

  queue = Queue.new
  queue.push root
  depth = 0

  until queue.empty?
    length = queue.size
    sum = 0

    length.times do |i|
      node = queue.pop
      sum += node.val.to_i

      queue.push node.left if node.left
      queue.push node.right if node.right
    end

    result[depth] = sum.to_f / length
    depth += 1
  end

  result
end


#################################
values = [3,1,5,0,2,4,6]
root = BinaryTreeBuilder.build(values)

BinaryTreeBuilder.print_tree(root)

p average_of_levels_dfs(root)
p average_of_levels_bfs(root)
