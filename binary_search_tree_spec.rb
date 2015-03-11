require_relative 'binary_search_tree'

describe BinaryTree do
  let(:tree) { BinaryTree.new(10) }
  let(:bigger_tree) {
    nums = [4, 9, 5, 12, 2]
    nums.each { |n| tree.insert(n) }
    tree
  }

  it "should have be able to initialize with a root node" do
    expect(tree.root.value).to eq 10
    expect(tree.root.left).to be_nil
    expect(tree.root.right).to be_nil
  end

  it "should be able to find values inserted into the tree" do
    expect(bigger_tree.search(5)).to be_a Node
  end

  it "should be able to traverse the tree in 'level-order'" do
    expect(bigger_tree.breadth_first).to eq [10, 4, 12, 2, 9, 5]
  end

  it "should be able to traverse the tree in 'pre-order'" do
    expect(bigger_tree.depth_first).to eq [10, 4, 2, 9, 5, 12]
  end

  it "should be able to traverse the tree in 'in-order'" do
    expect(bigger_tree.in_order).to eq [2, 4, 5, 9, 10, 12]
  end
end

# tree = BinaryTree.new 8
# nums = [4, 9, 5, 12, 2]
# nums.each { |n| tree.insert(n) }
#
# puts "Level-order: #{tree.breadth_first}"
# puts "Pre-order:   #{tree.depth_first}"
# puts "In-order:    #{tree.in_order}"
#
# puts "Number 50 is in the tree: #{tree.search 50}"
# puts "Number 4 is in the tree: #{tree.search 4}"
# puts "Number 5 is in the tree: #{tree.search 5}"
