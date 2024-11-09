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

    def delete(value)
        parent = find_parent(value)
        nodeToRemove = find_node(value)
        return false if nodeToRemove.nil?
        if nodeToRemove.left.nil? && nodeToRemove.right.nil?
            parent.value > nodeToRemove.value ? parent.set_left(nil) : parent.set_right(nil)
            # base care for recursion of removal of the parent
            return
        end
        if nodeToRemove.left && nodeToRemove.right
            nextNode =  nodeToRemove.right
            while nextNode.left
                nextNode = nextNode.left
            end
            if nextNode != nodeToRemove.right
                delete(nextNode.value)
                nodeToRemove.value = nextNode.value
            else
                nodeToRemove.set_value(nextNode.value)
                nodeToRemove.set_right(nodeToRemove.right.right)
            end
            # dont go any futher 
            return 
        end
        # if either the left or right child exists then
        childNode = nodeToRemove.left || nodeToRemove.right
        if parent
            childNode.value == nodeToRemove.left.value ?   parent.set_left(childNode) : parent.set_right(childNode)
        else
            nodeToRemove.set_value(childNode.value)
            nodeToRemove.set_left(childNode.left)
            nodeToRemove.set_right(childNode.right)
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

    # Traversal

    # Since it's recursion.. yield block might not be passing to the recusive calls and therefore we explicilty 
    # pass the block if it exists..
    # without &block we wont be able to pass the do this end block to other recursive calls and therefore,
    # it will be inconsistent and will only occur once but if we pass block to every recursive call we 
    # can use the same block in every recursive call that we make.s
    def inOrder(root = @root, &block)
        unless root.nil?
            inOrder(root.left, &block)
            block_given? ? yield(root.value) : puts(root.value)
            inOrder(root.right, &block)
        end
    end
    def preOrder(root = @root, &block)
        unless root.nil?
            block_given? ? yield(root.value) : puts(root.value)
            preOrder(root.left, &block)
            preOrder(root.right, &block)
        end
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