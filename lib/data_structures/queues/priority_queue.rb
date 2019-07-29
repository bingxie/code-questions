class PriorityQueue
  def initialize(type = :min)
    @elements = [nil]

    if type == :min
      @compare = ->(a,b) { (a <=> b) < 0 }
    elsif type == :max
      @compare = ->(a,b) { (a <=> b) > 0 }
    end
  end

  def peek
    @elements[1]
  end

  def items
    @elements[1..last_index]
  end

  def push(element)
    @elements << element
    bubble_up(last_index)
  end

  def pop
    # exchange the root with the last element
    exchange(1, last_index)

    # remove the last element of the list
    max = remove_last_child

    # and make sure the tree is ordered again
    bubble_down(1)

    max
  end

  private

  # Remvoe the last child
  def remove_last_child
    @elements.pop
  end

  def last_index
    @elements.size - 1
  end

  def bubble_up(index)
    # return if we reach the root element
    return if index <= 1

    parent_index = (index / 2)

    # if the parent is already greater|less than the child
    return if @compare[@elements[parent_index], @elements[index]]

    # otherwise we exchange the child with the parent
    exchange(index, parent_index)

    # and keep bubbling up
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index = (index * 2)

    # stop if we reach the bottom of the tree
    return if child_index > last_index

    # make sure we get the largest|smallest child
    not_the_last_element = child_index < last_index
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]
    child_index += 1 if not_the_last_element && @compare[right_element, left_element]

    # there is no need to continue if the parent element is already bigger|smaller
    # then its children
    return if @compare[@elements[index], @elements[child_index]]

    exchange(index, child_index)

    # repeat the process until we reach a point where the parent
    # is larger than its children
    bubble_down(child_index)
  end

  def exchange(source, target)
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end
end

pq = PriorityQueue.new(:min)

pq.push(1)
pq.push(2)
pq.push(3)
pq.push(4)
pq.push(4)
pq.push(5)

p pq.items

p pq.pop
p pq.pop
p pq.pop
p pq.pop
p pq.pop
p pq.pop