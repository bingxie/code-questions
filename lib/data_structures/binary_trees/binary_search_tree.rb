class BinarySearchTree
  attr_accessor :root_node

  def initialize(root_node)
    @root_node = root_node
  end

  def search(value, node)
    return if value.nil? || node.nil?

    return node if node.value == value

    if value > node.value
      search(value, node.right)  # search right sub tree
    else
      search(value, node.left)   # search left sub tree
    end
  end

  def min(node)
    return nil if node.nil?

    return node.value if node.left.nil?

    min(node.left)
  end

  def max(node)
    return nil if node.nil?

    return node.value if node.right.nil?

    min(node.right)
  end

  def insert(value, node)
    return if value.nil || node.nil?

    return if value == node.value

    if value > node.value
      if node.right
        insert(value, node.right)
      else
        node.right = TreeNode.new(value)
      end
    elsif value < node.value
      if node.left
        insert(value, node.leff)
      else
        node.leff = TreeNode.new(value)
      end
    end
  end
end
