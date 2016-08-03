module BinaryTree
  def self.from_array(array)
    Node.new(array.first).tap do |tree|
      array.each {|v| tree.push v }
    end
  end

  class EmptyNode
    def to_a
      []
    end

    def include?(*)
      false
    end

    def push(*)
      false
    end
    alias_method :<<, :push

    def inspect
      "{}"
    end
  end

  class Node
    # our three features:
    attr_reader :value
    attr_accessor :left, :right

    def initialize(v)
      @value = v
      @left = EmptyNode.new
      @right = EmptyNode.new
    end

    def push(v)
      case value <=> v
      when 1 then push_left(v)
      when -1 then push_right(v)
      when 0 then false # the value is already present
      end
    end
    alias_method :<<, :push

    def inspect
      "{#{value}:#{left.inspect}|#{right.inspect}}"
    end

    def to_a
      left.to_a + [value] + right.to_a
    end

    private

      def push_left(v)
        left.push(v) or self.left = Node.new(v)
      end

      def push_right(v)
        right.push(v) or self.right = Node.new(v)
      end
  end
end

input_array = [7, 4, 9, 1, 6, 14, 10]
p BinaryTree.from_array(input_array)
