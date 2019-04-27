require 'set'
require 'pry'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def cycle_list?(head)
  # return false if head.nil? || head.next.nil?
  visited_nodes = Set.new
  while head
    return true if visited_nodes.include?(head)

    visited_nodes.add(head)
    head = head.next
  end
  false
end

def cycle_list2?(head)
  slower = head
  faster = head

  while slower && faster && faster.next
    slower = slower.next
    faster = faster.next.next

    return true if slower == faster
  end
  false
end

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2

p cycle_list?(node1)

node5 = ListNode.new(5)
node6 = ListNode.new(6)
node5.next = node6
node6.next = node5

p cycle_list?(node5)

node7 = ListNode.new(7)
p cycle_list?(node7)

p cycle_list?(node1)
p cycle_list?(node5)
p cycle_list?(node7)
