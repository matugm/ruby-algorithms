
class BinaryTree
  attr_reader :root

  def initialize(root_value)
    @root = Node.new(root_value)
  end

  def insert(value, node = @root)
    # Base case: we found an empty leaf
    if node.value.nil?
      node.value = value
      return
    end

    if value > node.value
      insert_right(node, value)
    else
      insert_left(node, value)
    end
  end

  # Binary search
  def search(num)
    stack = []
    stack << @root

    while stack.size > 0
      node = stack.shift

      return node  if node.value == num
      return false if node.left.nil? && node.right.nil?

      if num < node.value
        stack << node.left
      else
        stack << node.right
      end
    end
  end

  def in_order(focus_node = @root, values = [])
    unless focus_node.nil?
      in_order(focus_node.left, values)
      values << focus_node.value
      in_order(focus_node.right, values)
    end

    values
  end

  # Also know as level order in binary tree parlance
  def breadth_first
    stack  = []
    values = []
    stack << @root

    while stack.size > 0
      node = stack.shift
      stack << node.left  unless node.left.nil?
      stack << node.right unless node.right.nil?

      values << node.value
    end

    values
  end

  # Also know as pre-order traversal in binary tree parlance
  def depth_first(node = @root, values = [])
    if node
      values << node.value

      depth_first(node.left, values)
      depth_first(node.right, values)
    end

    values
  end

  private

  def insert_left(node, value)
    if node.left.nil?
      node.left = Node.new(value)
    else
      insert(value, node.left)
    end
  end

  def insert_right(node, value)
    if node.right.nil?
      node.right = Node.new(value)
    else
      insert(value, node.right)
    end
  end
end

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end
end
