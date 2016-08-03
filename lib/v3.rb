class Tree
  attr_accessor :left
  attr_accessor :right
  attr_accessor :payload

  def initialize(payload = nil)
    @left = nil
    @right = nil
    @payload = payload
  end

  def insert(payload)
     if @payload == nil
       @payload = payload
     elsif payload <= @payload
       if @left == nil
         @left = Tree.new payload
       else
         @left.insert payload
       end
     else
       if @right == nil
         @right = Tree.new payload
       else
         @right.insert payload
       end
     end
   end

   def inorder
    @left.inorder {|item| yield item} if @left != nil
    yield @payload
    @right.inorder {|item| yield item} if @right != nil
  end

  def sorted_array
    values = []
    self.inorder { |value| values << value }
    values
  end
end

items = [7, 4, 9, 1, 6, 14, 10]
tree = Tree.new
items.each {|payload| tree.insert(payload)}
array = []
p tree.sorted_array
