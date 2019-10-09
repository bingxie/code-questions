# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  !max_depth(root).nil?
end


def max_depth(node)  # Recursion
  return 0 if node.nil?

  left_depth = max_depth(node.left)
  right_depth = max_depth(node.right)

  return nil if (left_depth.nil? || right_depth.nil?)  #有一个子树不平衡

  return nil if (left_depth - right_depth).abs > 1  # 当前节点树不平衡

  [left_depth, right_depth].max + 1
end
###############################
# Approach 2: Iteration  (Stack)

def is_balanced2(root)
  return true if root.nil?

  depths = []
  nodes = []
  nodes.push [root, 0]

  until nodes.empty?
    p nodes

    node, depth = nodes.pop

    if node.left.nil? && node.right.nil? # leaf node
      unless depths.include?(depth)
        depths.push depth
        p depths
        if depths.size > 2 || (depths.size == 2 && (depths[0] - depths[1]).abs > 1)
          return false
        end
      end
    else
      nodes.push [node.left, depth + 1] if node.left
      nodes.push [node.right, depth + 1] if node.right
    end
  end

  return false if depths.size == 1 && depths.first > 1

  true
end


############################
node1 = TreeNode.new(3)
node2 = TreeNode.new(9)
node3 = TreeNode.new(20)
node4 = TreeNode.new(15)
node5 = TreeNode.new(7)

node1.left = node2
node1.right = node3
node3.left = node4
node3.right = node5

p is_balanced(node1)  # true
p is_balanced2(node1)  # true

node6 = TreeNode.new(1)
node7 = TreeNode.new(2)
node8 = TreeNode.new(3)
node6.right = node7
node7.right = node8

p is_balanced(node6)  #false
p is_balanced2(node6)  #false
