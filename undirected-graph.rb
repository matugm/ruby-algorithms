class UndirectedGraph
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
    if @list[value]
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
    return if queue.empty?

    node = get_node(queue.shift)
    values << node.value

    node.each_neighbor do |n|
      visited = (values.include? n and !queue.include? n)
      unless visited
        queue << n
      end
    end

    bfs(queue, values)

    values
  end

  def node_count
    @list.size
  end

  def edge_count
    @edge_count
  end

  private

  def add_neighbor(node1, node2)
    node = get_node(node1)
    unless node.contains node2
      node.add_neighbor node2
    end
  end

  def get_node(node_str)
    @list[node_str]
  end

  def add_node(value)
    @list[value] = Node.new(value, [])
  end

  def link_nodes(n, value)
    node = get_node(n)

    if node and !node.contains value
      node.add_neighbor value
    end
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

graph = UndirectedGraph.new
graph.insert("B", "A")
graph.insert("X", "A")
graph.insert("C", "A")
graph.insert("D", "C")
graph.delete("X")

p graph.bfs(["A"]) # ["A", "B", "C", "D"]

puts "Nodes: #{graph.node_count} Edges: #{graph.edge_count}"

