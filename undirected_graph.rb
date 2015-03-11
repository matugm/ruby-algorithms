class UndirectedGraph
  attr_reader :edge_count

  def initialize
    @list = {}
    @edge_count = 0
  end

  def insert(new_node, neighbor)
    add_node(new_node) unless @list[new_node]
    add_node(neighbor) unless @list[neighbor]

    add_neighbor(new_node, neighbor)
    add_neighbor(neighbor, new_node)
    @edge_count += 1
  end

  def insert_multiple(value, neighbors)
    if get_node(value)
      @list[value].neighbors += neighbors
    else
      @list[value] = Node.new(value, neighbors)
    end

    # Register new node with his neighbors
    neighbors.each do |n|
      link_nodes(n, value)
    end
  end

  def delete(value)
    node = get_node(value)
    node.each_neighbor { |n| get_node(n).delete_neighbor(value) }
    @list.delete(value)
  end

  # Breadth-first search
  def bfs(queue, values = [])
    return values if queue.empty?

    node = get_node(queue.shift)
    values << node.value

    node.each_neighbor do |n|
      visited = values.include?(n) && !queue.include?(n)
      queue << n unless visited
    end

    bfs(queue, values)
  end

  def node_count
    @list.size
  end

  private

  def add_neighbor(node1, node2)
    node = get_node(node1)
    node.add_neighbor(node2) unless node.contains(node2)
  end

  def get_node(node_str)
    @list[node_str]
  end

  def add_node(value)
    @list[value] = Node.new(value, [])
  end

  def link_nodes(n, value)
    node = get_node(n)
    return unless node

    node.add_neighbor(value) unless node.contains(value)
  end
end

class Node
  attr_accessor :value, :neighbors, :visited

  def initialize(value, neighbors)
    @value     = value
    @neighbors = neighbors
    @visited = false
  end

  def contains(other_node)
    @neighbors.include? other_node
  end

  def add_neighbor(other_node)
    @neighbors << other_node
  end

  def delete_neighbor(other_node)
    @neighbors.delete(other_node)
  end

  def each_neighbor
    @neighbors.each { |n| yield n }
  end
end
