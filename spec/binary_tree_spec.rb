require "spec_helper"

RSpec.describe BinaryTree do
  describe "sort" do
    it "should order an array" do
      array = [7, 4, 9, 1, 6, 14, 10]
      sorted_array = [1, 4, 6, 7, 9, 10, 14]

      result = BinaryTree.sort(array)

      expect(result).to eq sorted_array
    end
  end
end
