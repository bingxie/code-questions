class TreeNode
  attr_accessor :value, :left_child, :right_child

  def initialize(value, left: nil, right: nil)
    @value = value
    @left_child = left
    @right_child = right
  end
end
