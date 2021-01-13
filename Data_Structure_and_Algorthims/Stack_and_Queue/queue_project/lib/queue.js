// ============================================================================
// Implementation Exercise: Queue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Queue and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those
// in the table provided in the Time and Space Complexity Analysis section
// of your Stack reading!
//
// -----------
// Let's Code!
// -----------

class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class Queue {
  constructor() {
    this.front = null;
    this.back = null;
    this.length = 0;
  }

  enqueue(value) {
    let newNode = new Node(value);

    if (!this.front) {
      this.front = newNode;
      this.back = newNode;
    } else {
      let temp = this.back;
      this.back = newNode;
      temp.next = this.back;
    }

    return ++this.length;
  }

  dequeue() {
    if (!this.front) return null;

    let dequeued = this.front;
    if (this.front === this.back) {
      this.front = null;
      this.back = null;
    } else {
      this.front = dequeued.next;
      dequeued.next = null;
    }

    this.length--;
    return dequeued.value;
  }

  size() {
    return this.length;
  }
}

exports.Node = Node;
exports.Queue = Queue;
