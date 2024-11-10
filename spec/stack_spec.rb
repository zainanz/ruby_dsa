require_relative "../src/Data Structure/Stack/stack.rb"
RSpec.describe Stack do
    describe "#intiialize" do
        stack = Stack.new
        it "creates an instance of a stack" do
            expect(stack.class).to eq(Stack)
        end
    end
    stack = Stack.new
    stack.push(10)
    stack.push(20)
    stack.push(30)
    stack.push(40)
    stack.push(50)
    describe "#push" do
        it "pushes expects the value to be 10" do
            expect(stack.peek).to eq(50)
        end
    end
    describe "#pop" do
        it "#pops the stacks" do
            expect(stack.pop.value).to eq(50)
            expect(stack.pop.value).to eq(40)
            expect(stack.pop.value).to eq(30)
        end
    end
    describe "#peek" do
        it "checks if peek equals 20" do
            expect(stack.peek).to eq(20)
        end
    end
end