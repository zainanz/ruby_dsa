require_relative "../src/Data Structure/Linked_List/linked_list.rb"
puts "Testing starts"
RSpec.describe Node do
    describe '#initialize' do
      it 'Checks for initilizer. node = Node.new(5) > node.value must equal 5' do
        node = Node.new(5)
        expect(node.value).to eq(5)
        expect(node.class).to eq(Node)
      end
    end
    describe "#next_node, #prev_node & #set_next_node, #set_prev_node" do
      node = Node.new(5)
      it "checks if node.next_node equals nil" do
        expect(node.next_node).to eq(nil)
      end
      it "checks if previous and next node setter works" do
        next_node = Node.new(10)
        prev_node = Node.new(0)
        node.set_next_node(next_node)
        node.set_prev_node(prev_node)
        expect(node.next_node).to eq(next_node)
        expect(node.prev_node).to eq(prev_node)
      end
    end
    describe "#remove_next_node & #remove_prev_node" do
      node = Node.new(0)
      next_node = Node.new(10)
      prev_node = Node.new(0)
      node.set_next_node(next_node)
      node.set_prev_node(prev_node)
      it "Checks if remove_prev_node and remove_next_node works" do
        node.remove_next_node
        expect(node.next_node).to eq(nil)
        node.remove_prev_node
        expect(node.prev_node).to eq(nil)
      end
    end
end

RSpec.describe Linked_List do
  describe '#initialize' do
    it "initializes Linked List - head and tails should be nil" do 
      ll = Linked_List.new
      expect(ll.head).to eq(nil)
      expect(ll.tail).to eq(nil)
    end
  end
  describe '#add_to_head, #add_to_tail' do
    it "adds a node to the head inside a linked list #add_to_head" do
      ll = Linked_List.new
      ll.add_to_head(5)
      expect(ll.head.value).to eq(5)
      ll.add_to_head(10)
      expect(ll.head.value).to eq(10)
    end
    it "adds a node to the head inside a linked list #add_to_tail" do
      ll = Linked_List.new
      ll.add_to_tail(3)
      expect(ll.tail.value).to eq(3)
      ll.add_to_tail(5)
      expect(ll.tail.value).to eq(5)
    end
  end
  describe "#remove_node" do
    it "removes a node from the linked list" do
      ll = Linked_List.new
      ll.add_to_head(5)
      expect(ll.tail.value).to eq(5)
      expect(ll.head.value).to eq(5)
      ll.add_to_head(10)
      ll.add_to_head(0)
      ll.add_to_head(50)
      expect(ll.head.value).to eq(50)
      ll.remove_node(50)
      expect(ll.head.value).to eq(0)
      expect(ll.tail.value).to eq(5)
      ll.remove_node(5)
      expect(ll.tail.value).to eq(10)
    end
  end
end