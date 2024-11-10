class Node
    attr_accessor :value, :nextNode
    def initialize(value)
        @value = value
        @nextNode = nil
    end
end
class Stack
    def initialize
        @head = nil
    end

    def peek 
        return @head.nil? ? nil : @head.value 
    end

    def push(value)
        node = Node.new(value)
        if @head.nil?
            @head = node
        else 
            node.nextNode = @head
            @head = node
        end 
        return @head
    end
    def pop
        return nil if @head.nil?
        cur_head = @head
        @head.nextNode.nil? ? @head = nil : @head = @head.nextNode
        return cur_head
    end
end