class LinkedList
  attr_accessor :first_node

  def initialize(first_node)
    @first_node = first_node
  end

  # returns the data at index
  def read(index)
    return if index.negative? || first_node.nil?

    current_index = 0
    current_node = first_node
    while current_index < index
      current_node = current_node.next_node
      current_index += 1

      return nil unless current_node
    end

    current_node.data
  end

  def index_of(value)
    current_index = 0
    current_node = first_node

    while current_node
      return current_index if current_node.data == value

      current_node = current_node.next_node
      current_index += 1
    end
    # nil
  end

  # rubocop:disable Metrics/MethodLength
  def insert_at_index(index, value)
    current_index = 0
    current_node = first_node

    while current_index < index
      current_index += 1
      current_node = current_node.next_node
    end

    new_node = Node.new(value)

    if current_index.zero?
      new_node.next_node = current_node
      @first_node = new_node
    else
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
  end
  # rubocop:enable Metrics/MethodLength

  def delete_at_index(index)
    current_index = 0
    current_node = first_node

    @first_node = first_node.next_node if index.zero?

    while current_index < index - 1
      current_index += 1
      current_node = current_node.next_node
    end

    deleted_node = current_node.next_node
    current_node.next_node = deleted_node.next_node
    deleted_node.next_node = nil
  end
end
