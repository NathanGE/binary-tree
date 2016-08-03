class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload = nil, left = nil, right = nil)
    @payload = payload
    @left = left
    @right = right
  end
end
