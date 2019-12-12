# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  prep = dummy_head = ListNode.new(0)

  while l1 || l2
    if l1 && (l2.nil? || l1.val <= l2.val)
      prep.next = l1
      prep = l1
      l1 = l1.next
    else
      prep.next = l2
      prep = l2
      l2 = l2.next
    end
  end

  dummy_head.next
end

def merge_two_lists_recursion(l1, l2)
  if l1.nil?
    l2
  elsif l2.nil?
    l1
  elsif l1.val < l2.val
    l1.next = merge_two_lists_recursion(l1.next, l2)
    l1
  else
    l2.next = merge_two_lists_recursion(l1, l2.next)
    l2
  end
end

node1 = ListNode.new(1)
node2 = ListNode.new(4)
node3 = ListNode.new(5)
l1 = node1
node1.next = node2
node2.next = node3

node4 = ListNode.new(1)
node5 = ListNode.new(2)
node6 = ListNode.new(3)
node7 = ListNode.new(6)
l2 = node4
node4.next = node5
node5.next = node6
node6.next = node7

pp merge_two_lists(l1, l2)

pp merge_two_lists_recursion(l1, l2)
