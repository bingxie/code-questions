class QueueTwoStacks
  attr_reader :in_stack, :out_stack

  # Implement the enqueue and dequeue methods
  def initialize
    @in_stack = []
    @out_stack = []
  end

  def enqueue(item)
    in_stack.push item
  end

  def dequeue
    if out_stack.empty?
      until in_stack.empty?
        newest_in_stack_item = in_stack.pop
        out_stack.push newest_in_stack_item
      end
    end

    if out_stack.empty?
      raise 'queue is empty now'
    else
      out_stack.pop
    end
  end
end
