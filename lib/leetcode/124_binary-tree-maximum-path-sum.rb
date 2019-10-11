# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}

def max_path_sum(root)
  @max = Float::INFINITY
  max_path_recursive(root)
  return @max
end

def max_path_recursive(node)
  if node == nil
      return 0
  else
      # possibilities
      # 1. self
      # 2. left + self
      # 3. right + self
      # 4 self + left + right
      left = max_path_recursive(node.left)
      right = max_path_recursive(node.right)

      max_path = [node.val, node.val+left, node.val+right].max

      @max = [max_path, @max, node.val + left + right].max

      return max_path
  end

end
