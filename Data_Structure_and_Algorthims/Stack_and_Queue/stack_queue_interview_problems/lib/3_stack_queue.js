// ============================================================================
// Interview Problem: StackQueue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement your preferred Stack implementation, including the methods:
//
//   - Push
//   - Pop
//   - Size
//
// Then, implement a Queue by instantiating two Stack instances for storage.
//
// The StackQueue implementation should include the following methods:
//
//   - Enqueue
//   - Dequeue
//   - Size
//
// -----------
// Let's code!
// -----------

class Node {
  // Implemented the Node class!
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class Stack {
  // Implemented the Stack
  constructor() {
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }

  push(val) {
    if (!this.top) {
      this.top = val;
      this.bottom = val;
    } else {
      const temp = this.top;
      this.top = val;
      this.top.next = temp;
    }
    return ++this.length;
  }

  pop() {
    if (!this.top) return null;
    const temp = this.top;
    if (this.top === this.bottom) {
      this.bottom = null;
    }
    this.top = this.top.next;
    this.length--;
    return temp;
  }

  size() {
    return this.length;
  }
}

class StackQueue {
  // TODO: Implement the StackQueue class!
  constructor() {
    this.front = null;
    this.back = null;
    this.length = 0;
    this.outStack = new Stack();
    this.inStack = new Stack();
  }

  enqueue(value) {
    this.inStack.push(new Node(value));

    if (!this.outStack.length) {
      this.front = this.inStack.bottom;
      this.back = this.inStack.top;
    } else {
      this.front = this.outStack.top;
      this.back = this.inStack.top;
    }

    return ++this.length;
  }

  dequeue() {
    let temp = null;
    if (this.outStack.length) {
      temp = this.outStack.pop();
    } else if (this.inStack.length) {
      let idx = this.inStack.length;
      while (idx > 0) {
        this.outStack.push(this.inStack.pop());
        idx -= 1;
      }
      temp = this.outStack.pop();
    } else {
      this.front = null;
      this.back = null;
      return null;
    }

    if (!this.outStack.length) {
      this.front = this.inStack.bottom;
      this.back = this.inStack.top;
    } else {
      this.front = this.outStack.top;
      this.back = this.inStack.top;
    }

    this.length--;
    return temp;
  }

  size() {
    return this.length;
  }
}

exports.Node = Node;
exports.Stack = Stack;
exports.StackQueue = StackQueue;
