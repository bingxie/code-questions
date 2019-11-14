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
def add_two_numbers(first, second)
  modulus = 0
  previous = dummy_head = ListNode.new(nil)

  while first || second || modulus.nonzero?
    modulus, quotient = [first&.val, second&.val, modulus].compact.sum.divmod(10)

    current = ListNode.new(quotient)
    previous.next = current

    previous = current
    first = first&.next
    second = second&.next
  end

  dummy_head.next
end

l1 = ListNode.new(2)
node2 = ListNode.new(4)
node3 = ListNode.new(3)
l1.next = node2
node2.next = node3

l2 = ListNode.new(5)
node4 = ListNode.new(6)
node5 = ListNode.new(4)
l2.next = node4
node4.next = node5

pp add_two_numbers(l1, l2)
