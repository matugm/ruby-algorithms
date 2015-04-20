require_relative 'binary_search_tree'

def build_tree(numbers, root)
  tree = BinaryTree.new(root)
  numbers.each { |n| tree.insert(n) }
  tree
end

describe BinaryTree do
  let(:tree) { BinaryTree.new(10) }

  let(:bigger_tree)     { build_tree([4, 9, 5, 12, 2], 10)  }
  let(:right_leaf_tree) { build_tree([4, 9, 10, 12, 2], 11) }

  it "should be able to initialize with a root node" do
    expect(tree.root.value).to eq 10
    expect(tree.root.left).to be_nil
    expect(tree.root.right).to be_nil
  end

  it "should be able to find values inserted into the tree" do
    expect(bigger_tree.search(5)).to be_a Node
  end

  it "should be able to delete a leaf node" do
    bigger_tree.delete(5)
    expect(bigger_tree.search(5)).to be_falsey
  end

  it "should be able to delete a node with one children" do
    bigger_tree.delete(9)
    expect(bigger_tree.search(5)).to be_truthy
    expect(bigger_tree.search(9)).to be_falsey
  end

  # 11 is root, 10 is our leaf
  it "should be able to delete a node with children on the right" do
    right_leaf_tree.delete(9)
    expect(right_leaf_tree.search(10)).to be_truthy
    expect(right_leaf_tree.search(9)).to be_falsey
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
