def kth_smallest(root, k)
  stack = []

  current_node = root

  while current_node || !stack.empty?
    while current_node
      stack.push current_node
      current_node = current_node.left
    end

    current_node = stack.pop
    k -= 1
    return current_node.val if k == 0

    current_node = current_node.right
  end
end
