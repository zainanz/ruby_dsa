require_relative "../src/Data Structure/Queue/queue.rb"

RSpec.describe Queue do
    queue = Queue.new
    describe "#initialize" do
        it "#initializes a queue" do
            expect(queue.class).to eq(Queue)
        end
    end
    describe "#peek" do
        it "returns false if its empty" do
            expect(queue.peek).to eq(false)
        end
    end
    describe "#enqueue" do
        it "#enqueues a value" do
            queue.enqueue(5)
            expect(queue.peek).to eq(5)
        end
    end
    describe "#dequeue" do
        it "dequeues a value" do
            expect(queue.dequeue.class).to eq(Node)
            expect(queue.peek).to eq(false)
        end
    end
end