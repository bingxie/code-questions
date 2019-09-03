# Tags: Linkedlist, two pointers
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  # count the nodes 5
  # n = 2
  # 5 - 2 = 3, delete the next
  length = 0
  dummy = ListNode.new(0)
  dummy.next = head

  node = head
  while node
    node = node.next
    length += 1
  end

  num = length - n

  node = dummy
  num.times do |_i|
    node = node.next
  end

  node.next = node.next.next

  dummy.next
end

def remove_nth_from_end2(head, n) # two pointers
  dummy = ListNode.new(0)
  dummy.next = head

  pointer1 = dummy
  pointer2 = dummy

  n.times do |_i|
    pointer1 = pointer1.next
  end

  while pointer1.next
    pointer1 = pointer1.next
    pointer2 = pointer2.next
  end

  pointer2.next = pointer2.next.next

  dummy.next
end

# 0 1 2 3 (4) 5  #2

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)
node5 = ListNode.new(5)
head = node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

pp head

remove_nth_from_end(head, 2)

pp head
