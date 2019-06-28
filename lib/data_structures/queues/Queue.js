class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class Queue {
  constructor() {
    this.first = null;
    this.last = null;
    this.length = 0;
  }
  peek() {
    if (!this.first) {
      return null;
    }
    return this.first.value;
  }
  enqueue(value) {
    const newNode = new Node(value);
    if (this.length === 0) {
      this.first = newNode;
      this.last = newNode;
    } else {
      this.last.next = newNode;
      this.last = newNode;
    }

    this.length++;
    return this;
  }
  dequeue() {
    if (!this.last) {
      return null;
    }

    if (this.last === this.first) {
      this.last = null;
    }

    const node = this.first;
    this.first = node.next;
    node.next = null;
    this.length--;

    return this;
  }
  //isEmpty;
}

const myQueue = new Queue();
myQueue.enqueue("google");
console.log(myQueue.enqueue("yahoo"));
console.log(myQueue.enqueue("twitter"));
console.log(myQueue.peek());
myQueue.dequeue();
console.log(myQueue.peek());
myQueue.dequeue();
console.log(myQueue.peek());
myQueue.dequeue();
console.log(myQueue.peek());
