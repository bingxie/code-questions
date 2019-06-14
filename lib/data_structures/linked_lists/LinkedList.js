class Node {
  constructor(value, next = null) {
    (this.value = value), (this.next = next);
  }
}

class LinkedList {
  constructor(value) {
    this.head = new Node(value);
    this.tail = this.head;
    this.length = 1;
  }

  append(value) {
    const newNode = new Node(value);

    this.tail.next = newNode;
    this.tail = newNode;
    this.length++;

    return this;
  }

  prepend(value) {
    const newNode = new Node(value, this.head);
    this.head = newNode;
    this.length++;

    return this;
  }

  printList() {
    const nodes = [];
    let currentNode = this.head;
    while (currentNode !== null) {
      nodes.push(currentNode.value);
      currentNode = currentNode.next;
    }

    console.log(nodes);
  }

  insert(index, value) {
    if (index > this.length) {
      return false;
    }

    if (index === 0) {
      return this.prepend(value);
    }

    const newNode = new Node(value);
    const leader = this.traverseToIndex(index - 1);
    newNode.next = leader.next;
    leader.next = newNode;

    return this;
  }

  reverse() {
    if (this.length <= 1) {
      return this;
    }

    let first = this.head;
    let second = this.head.next;
    this.tail = this.head;

    while (second) {
      const temp = second.next;
      second.next = first;
      first = second;
      second = temp;
    }
    this.tail.next = null;
    this.head = first;
    return this;
  }

  remove(index) {
    if (index >= this.length) {
      return null;
    }

    if (index == 0) {
      const removedNode = this.head;
      this.head = removedNode.next;

      this.length--;
      removedNode.next = null;
      return removedNode;
    } else {
      const leader = this.traverseToIndex(index - 1);
      const removedNode = leader.next;
      leader.next = removedNode.next;

      this.length--;
      removedNode.next = null;
      return removedNode;
    }
  }

  traverseToIndex(index) {
    let counter = 0;
    let currentNode = this.head;

    while (counter !== index) {
      currentNode = currentNode.next;
      counter++;
    }
    return currentNode;
  }
}

let myList = new LinkedList(10);
console.log(myList);

myList.append(5);
myList.append(16);

console.log(myList);

myList.prepend(1);
console.log(myList);

myList.printList();

myList.insert(4, 9);
myList.printList();

console.log(myList.remove(0));
myList.printList();

console.log(myList.remove(3));
myList.printList();

myList.reverse();
myList.printList();
