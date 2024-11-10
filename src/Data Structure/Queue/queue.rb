class Node
    attr_accessor :value, :nextNode
    def initialize(value)
        @value = value
        @nextNode = nil
    end
end

class Queue
    def initialize
        @head = nil
        @tail = nil
    end
    def enqueue(value)
        node = Node.new(value)
        if @head.nil? && @tail.nil?
            @head = node
            @tail = node
        end
        @tail.nextNode = node
        @tail = node
    end
    def dequeue
        if @tail.nil? && @head.nil?
            return false
        end
        removed_node = @head
        if @tail == @head
            @tail = nil
            @head = nil
        else
        @head = @head.nextNode
        end
        return removed_node
    end

    def peek
        return @head.nil? ? false : @head.value
    end
end