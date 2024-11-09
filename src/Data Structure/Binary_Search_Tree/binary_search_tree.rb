class Node
    attr_reader :value, :left, :right
    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end
    def set_left(left_node)
        @left = left_node
    end
    def set_right(right_node)
        @right = right_node
    end
    def set_value(new_value)
        @value = new_value
    end
    def remove_left
        @left = nil
    end
    def remove_right
        @right = nil
    end
end

class Tree
    attr_reader :root
    def initialize
        @root = nil
    end
    def insert(value)
        if @root.nil?
            node = Node.new(value)
            @root = node
        else 
            # We need a function so we can keep performing recursion on it.
            insert_node(root, value)

        end
    end

    def insert_node(root, value)
        if value > root.value
            # then it goes on the right node
            if root.right.nil?
                root.set_right(Node.new(value))
            else
                insert_node(root.right, value)
            end
        else
            if root.left.nil?
                root.set_left(Node.new(value))
            else
                insert_node(root.left, value)
            end
        end
    end

    def contains(value)
        contains_value(@root, value)
    end
    private
    def contains_value(root, value)
        if root.nil?
            return false
        end
        if root.value === value
            return true
        end
        if value > root.value
            contains_value(root.right, value)
        else
            contains_value(root.left, value)
        end
    end

end