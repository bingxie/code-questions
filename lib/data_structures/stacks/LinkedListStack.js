class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }
  peek() {
    if (this.top === null) {
      return null;
    }
    return this.top.value;
  }
  push(value) {
    const node = new Node(value);
    if (this.bottom === null) {
      this.bottom = node;
      this.top = node;
    } else {
      node.next = this.top;
      this.top = node;
    }
    this.length++;
  }
  pop() {
    if (this.isEmpty()) {
      return null;
    }

    if (this.top === this.bottom) {
      this.bottom = null;
    }

    const node = this.top;
    this.top = node.next;
    node.next = null;
    this.length--;
    return node.value;
  }
  isEmpty() {
    return this.length === 0;
  }
}

const myStack = new Stack();
console.log(myStack.isEmpty());

myStack.push("google");
myStack.push("Udeamy");
myStack.push("Discord");
console.log(myStack);

console.log(myStack.peek());
console.log(myStack.pop());
console.log(myStack.peek());
console.log(myStack.pop());
console.log(myStack.peek());
console.log(myStack.pop());
console.log(myStack.peek());
//Discord
//Udemy
//google
