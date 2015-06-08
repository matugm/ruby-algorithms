
class BinaryTree
  attr_reader :root, :search_path

  def initialize(root_value)
    @root = Node.new(root_value)
    @search_path = []
  end

  def insert(value, node = @root)
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
    @search_path.clear

    while stack.size > 0
      node = stack.shift
      @search_path << node

      return node  if node.value == num
      return false if node.left.nil? && node.right.nil?

      if num < node.value
        stack << node.left
      else
        stack << node.right
      end
    end
  end

  def delete(value)
    return unless search(value)

    if (children = @search_path.last.left || @search_path.last.right)
      # One children
      update_parent_node(value, children)
    else
      # Leaf node
      update_parent_node(value)
    end

    @search_path.last.value = nil
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
    queue  = []
    values = []
    queue << @root

    while queue.size > 0
      node = queue.shift
      queue << node.left  unless node.left.nil?
      queue << node.right unless node.right.nil?

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

  def update_parent_node(search_value, new_value = nil)
    if @search_path[-2].left == search_value
      @search_path[-2].left = new_value
    else
      @search_path[-2].right = new_value
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
