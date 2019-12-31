//Approach1: Brute Force
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
  let pa = headA;
  while (pa != null) {
    let pb = headB;
    while (pb != null) {
      if (pb == pa) return pa;
      pb = pb.next;
    }
    pa = pa.next;
  }
  return null;
};

// Approach 2: Hash Table
var getIntersectionNode2 = function(headA, headB) {
  let pa = headA;
  let set = new Set();

  while (pa != null) {
    set.add(pa);

    pa = pa.next;
  }

  let pb = headB;
  while (pb != null) {
    if (set.has(pb)) return pb;
    pb = pb.next;
  }

  return null;
};

// Approach 3: Two Pointers
var getIntersectionNode = function(headA, headB) {
  let pa = headA;
  let pb = headB;

  while (pa != pb) {
    pa = pa == null ? headB : pa.next;
    pb = pb == null ? headA : pb.next;
  }

  return pa;
};
