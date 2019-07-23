class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def remove_elements(head, val)
  return nil if head.nil?

  previous = ListNode.new(0)
  previous.next = head
  current = head
  while current
    if head.val == val
      head = head.next
    end

    if current.val == val
      previous.next = current.next
    else
      previous = previous.next
    end
    current = current.next
  end
  head
end

def remove_elements2(head, val)
  return nil if head.nil?
  node = head
  while node.next != nil
    if node.next.val == val
      node.next = node.next.next
    else
      node = node.next
    end
  end

  if head.val == val   # 需要单独处理head
    head = head.next
  end
  head
end