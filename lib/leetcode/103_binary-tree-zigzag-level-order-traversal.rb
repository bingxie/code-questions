# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
  return [] if root.nil?

  levels = []

  queue = Queue.new
  queue.push(root)
  height = 1

  until queue.empty?
    level = []
    length = queue.length

    length.times do |_i|
      node = queue.pop
      level.push node.val

      queue.push node.left if node.left
      queue.push node.right if node.right
    end
    if height % 2 == 1
      levels.push level
    else
      levels.push level.reverse
    end
    height += 1
  end

  levels
end