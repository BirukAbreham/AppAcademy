class Queue

  attr_reader :ivar

  def initialize
    # create ivar to store queue, here!
    @ivar = []
  end

  def enqueue(el)
    # adds an element to the queue
    @ivar << el
  end

  def dequeue
    # removes one element from the queue
    @ivar.shift
  end

  def peek
    # returns, but doesn't remove, the top element in the queue
    @ivar[0]
  end

end

queue = Queue.new

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)

p queue.ivar

p queue.dequeue
p queue.ivar

p queue.peek
p queue.ivar

