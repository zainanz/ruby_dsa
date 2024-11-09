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
        100.times do
            new_tree.insert(i)
            i+=1
        end
        it "testing insert using for loop" do
            expect(new_tree.root.left).to eq(nil)
            current_node = new_tree.root
            while current_node.right
                current_node = current_node.right
            end
            expect(current_node.value).to eq(100)
        end
        describe "#contains" do
            it "checks if contains work as expected with nodes inserted using for loop" do
                expect(new_tree.contains(1)).to eq(true)
                expect(new_tree.contains(110)).to eq(false)
                expect(new_tree.contains(3)).to eq(true)
                expect(new_tree.contains(4)).to eq(true)
            end
        end
        describe "#find_node" do
            it "test find node on the tree generated using for loop" do
                expect(new_tree.find_node(100).class).to eq(Node)
                expect(new_tree.find_node(100).value).to eq(100)
                expect(new_tree.find_node(110)).to eq(false)
                expect(new_tree.find_node(3).class).to eq(Node)
                expect(new_tree.find_node(3).value).to eq(3)
            end
        end
    end
    describe "Custom Tree test:" do            
        tree = Tree.new
        tree.insert(50)
        tree.insert(10)
        tree.insert(55)
        tree.insert(4)
        tree.insert(300)
        tree.insert(1)
        describe "#inOrder" do
            values = []
            tree.preOrder{|value| values.push(value) }
            it "Checks if in Order prints values in an order" do
                expect(values).to eq([50,10,4,1,55,300])
            end
        end
        describe "#inOrder" do
            values = []
            tree.inOrder{|value| values.push(value) }
            it "Checks if in Order prints values in an order" do
                expect(values).to eq([1,4,10,50,55,300])
            end
        end
        describe "#find_min & #find_max" do
            it "finds the mimum value" do 
                expect(tree.find_min).to eq(1)
            end
            it "finds the max value" do
                expect(tree.find_max).to eq(300)
                tree.insert(500)
                expect(tree.find_max).to eq(500)

            end
        end
        describe "#find_parent" do
            it "checks if the parent of 300 is 55" do
                expect(tree.find_parent(300).value).to eq(55)
            end
            it "checks if the parent of 500 is 300" do
                expect(tree.find_parent(500).value).to eq(300)
            end
            it "checks if the parent of 1 is nil" do
                expect(tree.find_parent(1).value).to eq(4)
            end
        end
        describe "#remove" do
            it "removes 500 making 300 the next max" do
                tree.delete(500)
                expect(tree.find_max).to eq(300)
            end
    
            it "removes 50 making 55 the new root" do
                tree.delete(50)
                expect(tree.root.value).to eq(55)
                expect(tree.root.right.value).to eq(300)
            end

        end
    end
end