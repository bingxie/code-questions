class Stack {
  constructor() {
    this.arr = [];
  }

  peek() {
    return this.arr[this.arr.length - 1];
  }

  push(value) {
    this.arr.push(value);
    return this.arr;
  }

  pop() {
    return this.arr.pop();
  }

  isEmpty() {
    return this.arr.length === 0;
  }
}

class Queue {
  constructor() {
    this.stack1 = new Stack();
    this.stack2 = new Stack();
  }

  enqueue(value) {
    while (!this.stack2.isEmpty) {
      this.stack1.push(this.stack2.pop());
    }
    this.stack1.push(value);
  }

  dequeue() {
    while (!this.stack1.isEmpty) {
      this.stack2.push(this.stack1.pop());
    }
    return this.stack2.pop();
  }

  peek() {
    while (!this.stack1.isEmpty) {
      this.stack2.push(this.stack1.pop());
    }
    return this.stack2.peek();
  }

  isEmpty() {
    return this.stack1.isEmpty() && this.stack2.isEmpty();
  }
}
