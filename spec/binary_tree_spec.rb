require_relative "../src/Data Structure/Binary_Search_Tree/binary_search_tree.rb"
RSpec.describe Node do
    describe "#initialize" do
        node = Node.new(4)
        it "Creates a new node" do
            expect(node.class).to eq(Node)
        end
    end
end
RSpec.describe Tree do
    describe "#initiliaze" do
        tree = Tree.new
        it "Creates a tree" do
            expect(tree.class).to eq(Tree)
        end
    end
    describe "#insert" do
        tree = Tree.new
        it "Inserts 5 in the tree" do
            tree.insert(5)
            expect(tree.root.value).to eq(5)
        end
        it "Inserts a less number 4 in the tree - expected to be on the left of the root (5)" do
            tree.insert(4)
            expect(tree.root.left.value).to eq(4)
        end
        it "Inserts a higher number 10 in the tree - expected to be on the right of the root" do
            tree.insert(10)
            expect(tree.root.right.value).to eq(10)
        end
        new_tree = Tree.new
        i = 1
        10.times do
            new_tree.insert(i)
            i+=1
        end
        it "testing insert using for loop" do
            expect(new_tree.root.left).to eq(nil)
            current_node = new_tree.root
            while current_node.right
                current_node = current_node.right
            end
            expect(current_node.value).to eq(10)
        end
    end
end