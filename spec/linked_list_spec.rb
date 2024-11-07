require_relative "../src/Data Structure/Linked_List/linked_list.rb"
puts "Testing starts"
RSpec.describe Node do
  puts "Node testing"
    describe '#initialize' do
      it 'Checks for initilizer. node = Node.new(5) > node.value must equal 5' do
        node = Node.new(5)
        expect(node.value).to eq(5)
      end
    end
    describe "#next_node & #set_next_node" do
      node = Node.new(5)
      it "checks if node.next_node equals nil" do
        expect(node.next_node).to eq(nil)
      end
      it "checks if previous and next node setter works" do
        next_node = Node.new(10)
        prev_node = Node.new(0)
        node.set_next_node(next_node)
        node.set_prev_node(prev_node)
        expect(node.next_node). to eq(next_node)
        expect(node.prev_node). to eq(prev_node)
      end
    end
end