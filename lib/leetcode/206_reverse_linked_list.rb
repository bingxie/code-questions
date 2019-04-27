# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# Time complexity : O(n)
# Space complexity : O(1)

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  current = head
  previous = nil  #建一个新的头指针，来重新构造 list
  until current.nil?
    # 下面的步骤的顺序很重要
    next_temp = current.next #在修改current.next之前，先保存起来
    current.next = previous
    previous = current
    current = next_temp
  end
  previous
end

def reverse_list2(head)
  return head if head.nil? || head.next.nil?

  rl = reverse_list2(head.next)
  puts head.val
  head.next.next = head
  head.next = nil

  rl
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
node4 = ListNode.new(4)
node3.next = node4

p list_values(head)

result = reverse_list(head)

p list_values(result)

result = reverse_list2(result)

p list_values(result)
