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
}

const myStack = new Stack();
console.log(myStack.push("google"));
console.log(myStack.peek());
console.log(myStack.push("yahoo"));
console.log(myStack.peek());

console.log(myStack.push("twtter"));
console.log(myStack.peek());

console.log(myStack.pop());
console.log(myStack.pop());
console.log(myStack.pop());

console.log(myStack.arr);
