# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
# rubocop:disable Metrics/MethodLength
def swap_pairs(head)
  return head if head.nil? || head.next.nil?

  current = head
  pair = current.next
  head = head.next

  while pair
    next_current = pair.next
    next_pair = next_current&.next

    current.next = next_pair || pair.next

    pair.next = current
    current = next_current
    pair = next_pair
  end
  head
end
# rubocop:enable Metrics/MethodLength

# Again, pre is the previous node, but here I create a dummy as previous node of the head. And again,
# a is the current node and b is the next node. This time I go one node further and call it c.
# To go from pre -> a -> b -> c to pre -> b -> a -> c
def swap_pairs2(head)
  pre = dummy = ListNode.new 0
  pre.next = head

  while (a = pre.next) && (b = a.next)
    c = b.next
    pre.next = b
    b.next = a
    a.next = c
    # ((pre.next = b).next = a).next = c
    pre = a
  end

  dummy.next
end

def list_values(head)
  array = []
  node = head
  until node.nil?
    array << node.val
    node = node.next
  end
  array
end

head = ListNode.new(1)
node2 = ListNode.new(2)
head.next = node2
node3 = ListNode.new(3)
node2.next = node3
# node4 = ListNode.new(4)
# node3.next = node4
# node5 = ListNode.new(5)
# node4.next = node5
# node6 = ListNode.new(6)
# node5.next = node6

p swap_pairs2(head)
