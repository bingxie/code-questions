def merge_k_lists(lists, s_idx = 0, e_idx = lists.size - 1)
  return if lists.empty?
  return lists[e_idx] if s_idx == e_idx

  mid = (s_idx + e_idx) / 2
  left = merge_k_lists(lists, s_idx, mid)
  right = merge_k_lists(lists, mid + 1, e_idx)

  merge_two_lists(left, right)
end

def merge_two_lists(l1, l2)
  dummy = curr = ListNode.new(nil)

  while l1 || l2
      if (l1 && l2 && l1.val < l2.val) || !l2
          curr.next, l1 = l1, l1.next
      elsif (l1 && l2) || !l1
          curr.next, l2 = l2, l2.next
      end
      curr = curr.next
  end

  dummy.next
end
