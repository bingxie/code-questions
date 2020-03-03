class LinkedListNode {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

function kthToLastNode(k, head) {
  if (k < 1) {
    throw new Error("Invalid input k");
  }

  let listLength = 1;
  let currentNode = head;

  while (currentNode.next) {
    currentNode = currentNode.next;
    listLength += 1;
  }

  if (k > listLength) {
    throw new Error("k is larger than the length of the linked list.");
  }

  const howFarToGo = listLength - k;

  currentNode = head;

  for (let i = 0; i < howFarToGo; i++) {
    currentNode = currentNode.next;
  }

  return currentNode;
}

function kthToLastNode2(k, head) {
  if (k < 1) {
    throw new Error("Invalid input k");
  }

  let leftNode = head;
  let rightNode = head;

  for (let i = 0; i < k - 1; i++) {
    rightNode = rightNode.next;
    if (!rightNode) {
      throw new Error("k is larger than the length of linkedlist");
    }
  }

  while (rightNode.next) {
    leftNode = leftNode.next;
    rightNode = rightNode.next;
  }

  return leftNode;
}

// Tests

let desc = "first to last node";
let nodes = valuesToLinkedListNodes([1, 2, 3, 4]);
let actual = kthToLastNode(1, nodes[0]);
let expected = nodes[3];
assertEquals(actual, expected, desc);

desc = "second to last node";
nodes = valuesToLinkedListNodes([1, 2, 3, 4]);
actual = kthToLastNode(2, nodes[0]);
expected = nodes[2];
assertEquals(actual, expected, desc);

desc = "first node";
nodes = valuesToLinkedListNodes([1, 2, 3, 4]);
actual = kthToLastNode(4, nodes[0]);
expected = nodes[0];
assertEquals(actual, expected, desc);

desc = "k greater than linked list length";
nodes = valuesToLinkedListNodes([1, 2, 3, 4]);
const fifthFromLast = () => kthToLastNode(5, nodes[0]);
assertThrows(fifthFromLast, desc);

desc = "k is zero";
nodes = valuesToLinkedListNodes([1, 2, 3, 4]);
const zeroFromLast = () => kthToLastNode(0, nodes[0]);
assertThrows(zeroFromLast, desc);

function valuesToLinkedListNodes(values) {
  const nodes = [];
  for (let i = 0; i < values.length; i++) {
    const node = new LinkedListNode(values[i]);
    if (i > 0) {
      nodes[i - 1].next = node;
    }
    nodes.push(node);
  }
  return nodes;
}

function assertEquals(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}

function assertThrows(func, desc) {
  try {
    func();
    console.log(`${desc} ... FAIL`);
  } catch (e) {
    console.log(`${desc} ... PASS`);
  }
}
