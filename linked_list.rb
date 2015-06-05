class LinkedList
  attr_reader :count

  def initialize
    @head  = nil
    @count = 0
  end

  def append(value)
    @count  += 1
    new_node = Node.new(value)

    @head ? @head.append(new_node) : @head = new_node
  end

  def find(value)
    @head.each_node.any? { |node| node.value == value }
  end
end

class Node
  attr_accessor :next, :value

  def initialize(value)
    @value = value
    @next  = nil
  end

  def append(new_node)
    self.each_node { |node| node.next = new_node and break if !node.next }
  end

  def each_node
    return enum_for(:each_node) unless block_given?

    yield self

    node = self

    yield node while (node = node.next)
  end
end
