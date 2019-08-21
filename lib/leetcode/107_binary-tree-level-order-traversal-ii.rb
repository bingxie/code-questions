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
def level_order_bottom(root)
  return [] if root.nil?

  levels = []

  queue = Queue.new
  queue.push(root)

  until queue.empty?
    level = []
    length = queue.length

    length.times do |_i|
      node = queue.pop
      level.push node.val

      queue.push node.left if node.left
      queue.push node.right if node.right
    end

    levels.unshift level # only difference with 102
  end

  levels
end
