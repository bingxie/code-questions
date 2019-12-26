// Definition for a Node.
function Node(val, next, random) {
  this.val = val;
  this.next = next;
  this.random = random;
}

// 把这个列表想象成图，然后这个问题就相当于如何遍历所有的边

// 方法一：
// 遍历一遍，通过链表的next指针把链表先copy一遍
// 同时遍历copy和愿链表，然后把random指针copy一遍
// 用hashmap记录新旧节点的对应关系
// 时间：O(n) 空间：O(n)
var copyRandomList = function(head) {
  if (!head) return null;

  let original = head,
    copy = new Node(original.val),
    copyHead = copy;
  let dict = new Map();
  dict.set(null, null);
  dict.set(original, copy);

  while (original.next) {
    copy.next = new Node(original.next.val);
    dict.set(original.next, copy.next);
    original = original.next;
    copy = copy.next;
  }

  original = head;
  copy = copyHead;
  while (original) {
    copy.random = dict.get(original.random);
    original = original.next;
    copy = copy.next;
  }

  return copyHead;
};

// 方法二：采用图的DFS方法，同时用hashmap保持mapping的记录和visited的记录
// 时间： O(n)  空间： O(n)
var copyRandomList2 = function(head) {
  let visited = new Map();

  const dfs_helper = node => {
    if (!node) return null;

    if (visited.has(node)) return visited.get(node);

    let newNode = new Node(node.val);
    visited.set(node, newNode);
    newNode.next = dfs_helper(node.next);
    newNode.random = dfs_helper(node.random);

    return newNode;
  };

  return dfs_helper(head);
};

// 方法三：目标是O(1) space
// 通过是旧节点后面插入新节点，来实现hashmap的mapping功能
let copyRandomList3 = function(head) {
  if (!head) return null;

  let old = head;
  let copy = null;

  // 1st pass - create copies of every node
  while (old) {
    copy = new Node(old.val);
    copy.next = old.next;

    old.next = copy;
    old = copy.next;
  }

  let copyHead = head.next;

  // 2nd pass - copy random pointers
  old = head;
  while (old) {
    copy = old.next;

    if (old.random) {
      copy.random = old.random.next;
    }

    old = copy.next;
  }

  // 3rd pass - separate original and copy into two separate lists
  old = head;
  while (old) {
    copy = old.next;

    old_n = old.next.next;

    copy.next = old_n ? old_n.next : null;
    old.next = old_n;

    old = old_n;
  }
  copy.next = null;

  return copyHead;
};
