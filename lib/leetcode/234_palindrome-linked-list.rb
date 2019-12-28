# 方法一，先转换成array，然后用two pointers进行判断
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  array = to_array(head)

  palindrom_array?(array)
end

def to_array(head)
  current = head
  result = []

  while current
    result.push current.val

    current = current.next
  end

  result
end

def palindrom_array?(array)
  left = 0
  right = array.size - 1

  while left < right
    return false if array[left] != array[right]
    left += 1
    right -= 1
  end

  true
end

# 方法二：Recursive实现，Space依然是O(n), 而且处理的链表长度会收到调用栈长度的限制
# @param {ListNode} head
# @return {Boolean}
def is_palindrome2(head)
  @front = head

  recurisively_check(head)
end

def recurisively_check(current)
  if current
    return false if !recurisively_check(current.next)

    return false if current.val != @front.val
    @front = @front.next
  end

  true
end

# 方法三： 把list的后半部分反转，然后比较，然后恢复
def is_palindrome3(head)
  return true if head.nil?

  # find the end of first half and reverse second half
  fisrt_half_end = end_of_first_half(head)
  second_half_start = reverse_list(fisrt_half_end.next)

  # check whether or not there is a palindrome
  p1 = head
  p2 = second_half_start

  result = true
  while result && p2
    result = false if p1.val != p2.val

    p1 = p1.next
    p2 = p2.next
  end

  fisrt_half_end.next = reverse_list(second_half_start)

  result
end

def reverse_list(head)
  current = head
  previous = nil  #建一个新的头指针，来重新构造 list

  while current
    # 下面的步骤的顺序很重要
    next_temp = current.next #在修改current.next之前，先保存起来
    current.next = previous
    previous = current
    current = next_temp
  end

  previous
end

# 快慢两个指针的技巧
def end_of_first_half(head)
  fast = head
  slow = head

  while fast.next && fast.next.next
    fast = fast.next.next
    slow = slow.next
  end

  slow
end
