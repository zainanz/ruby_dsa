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

    def find_parent(value, root = @root)
        if value === root.value
            return nil
        end
        if value < root.value
            return nil if root.left.nil?
            return root if root.left.value === value
            find_parent(value, root.left)
        else
            return nil if root.right.nil?
            return root if root.right.value === value
            find_parent(value, root.right)
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

    def find_node(value)
        contains_value(@root, value, true)
    end
    def find_min(root = @root)
        return root.value if(root.left.nil?)
        find_min(root.left)
    end
    def find_max(root = @root)
    return root.value if(root.right.nil?)
    find_max(root.right)
end
    private
    def contains_value(root, value, get_node = false)
        if root.nil?
            return false
        end
        if root.value === value
            return get_node ? root : true
        end
        if value > root.value
            contains_value(root.right, value, get_node)
        else
            contains_value(root.left, value, get_node)
        end
    end


end