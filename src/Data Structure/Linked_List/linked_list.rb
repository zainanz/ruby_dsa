class Node
    attr_accessor :value
    attr_reader :next_node, :prev_node
    def initialize(value)
      @next_node = nil
      @prev_node = nil
      @value = value  
    end
    def remove_prev_node
        @prev_node = nil
    end
    def remove_next_node
        @next_node = nil
    end
    def set_next_node(node)
        @next_node = node
    end
    def set_prev_node(node)
        @prev_node = node
    end
end

class Linked_List
    attr_reader :head, :tail
    def initialize
        @head = nil
        @tail = nil 
    end
    def contains(value)
        current_node = @head
        is_there = false
        while current_node.next_node
            if current_node.value == value
                is_there = true
                break
            end
            current_node = current_node.next_node;
        end
        return is_there
    end
    def add_to_tail(value)
        node = Node.new(value)
        if !@head && !@tail
            @tail = node
            @head = node
        else
            @tail.set_next_node(node);
            node.set_prev_node(@tail);
            @tail = node
        end
    end
    def add_to_head(value)
        node = Node.new(value);
        if !@tail && !@head
            @tail = node
            @head = node
        else
            @head.set_prev_node(node)
            node.set_next_node(@head)
            @head = node
        end
    end

    def remove_tail
        return false, {message: "linked list is empty."} if @head.nil?
        if @head == @tail 
            @head = nil
            @tail = nil
            return true
        end
        new_tail = @tail.prev_node
        new_tail.remove_next_node
        @tail = new_tail
        return true
    end

    def remove_head
        return false, {message: "linked list is empty."} if @head.nil? 
        if @head == @tail 
            @head = nil
            @tail = nil
            return true
        end
        new_head = @head.next_node
        new_head.remove_prev_node
        @head = new_head
        return true
    end

    def remove_node(value)
        # If you move bi-directional meanings from the tail backwards and from the head in front looking for 
        # it would take O(n/2) - Big O would be still be considered as Big O(N) because of the way we 
        # calculate big O notation - it would be an interesting approach. 
        # Please note this approach only works in doubley Linked lists.

        # here we will only traverse in single direction
        current_node = @head
        while current_node
            if current_node.value == value
                # if prev node doesnt exists means its the head therefore we call remove head func
                if current_node.prev_node.nil?
                    #remove head function
                    remove_head
                    break
                end
                if current_node.next_node.nil?
                    #remove tail function
                    remove_tail
                    break
                end
                prev_node = current_node.prev_node
                next_node = current_node.next_node
                prev_node.set_next_node(next_node)
                next_node.set_prev_node(prev_node)
                break;
            end
            current_node = current_node.next_node
        end
    end
    def traverse
        current_head = @head
        num = 1
        while current_head
            puts "#{num} - #{current_head.value} #{ "head" if current_head === @head } #{"tail" if current_head === @tail}"
            current_head = current_head.next_node
            num += 1
        end
    end
end



