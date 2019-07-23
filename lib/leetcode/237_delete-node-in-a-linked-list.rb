# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node(node)
  next_node = node.next
  if next_node
    node.val = next_node.val
    node.next = next_node.next

    next_node.next = nil
  else
    raise "Can't delete the last node with this technique!"
  end
end

head = ListNode.new(4)
a = ListNode.new(5)
b = ListNode.new(1)
c = ListNode.new(9)
head.next = a
a.next = b
b.next = c

delete_node(head, a)
p head
