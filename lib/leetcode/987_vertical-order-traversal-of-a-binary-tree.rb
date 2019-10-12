require_relative '../data_structures/binary_trees/binary_tree_builder'
# @param {TreeNode} root
# @return {Integer[][]}
def vertical_traversal(root)
  return [] unless root

  all_positions = {}
  position(root, [0, 0], all_positions)

  result = []
  all_positions.sort.each do |_, x|
    result << x.sort.reverse.to_h.values.flatten
  end
  result
end

def position(root, position, all_positions)
  x, y = position

  if all_positions.key?(x)
    all_positions[x][y] = if all_positions[x].key?(y)
                            (all_positions[x][y] << root.val).sort
                          else
                            [root.val]
                          end
  else
    all_positions[x] = { y => [root.val] }
  end

  position(root.left, [x - 1, y - 1], all_positions) if root.left
  position(root.right, [x + 1, y - 1], all_positions) if root.right
end

root = BinaryTreeBuilder.build([3, 9, 20, nil, nil, 15, 7])
BinaryTreeBuilder.print_tree root

p vertical_traversal(root)
