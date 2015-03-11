require_relative 'undirected_graph'

describe UndirectedGraph do
  let(:graph) { UndirectedGraph.new }

  it "counts number of nodes" do
    graph.insert("B", "A")
    expect(graph.node_count).to eq 2
  end

  it "counts number of edges" do
    graph.insert("B", "A")
    expect(graph.edge_count).to eq 1
  end

  it "finds the correct path using BFS" do
    graph.insert("B", "A")
    graph.insert("C", "A")
    graph.insert("D", "C")

    expect(graph.bfs(["A"])).to eq ["A", "B", "C", "D"]
  end

  it "can delete nodes" do
    graph.insert("B", "A")
    graph.insert("C", "A")
    graph.insert("D", "C")
    graph.delete("C")

    expect(graph.bfs(["A"])).to eq ["A", "B"]
  end
end
