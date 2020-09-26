require "tdd"

describe Array do
  describe "#my_uniq" do
    it "removes duplicate values of the array" do
      expect([1, 1, 2, 2, 3, 4, 5].my_uniq).to eq([1, 2, 3, 4, 5])
    end
  end

  describe "#two_sum" do
    it "finds all pairs of positions where the elements at those positions sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([ [0, 4], [2, 3] ])
    end
  end

  describe "#my_transpose" do
    it "returns the transpose of a 2d matrix" do
      arr_1 = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      exc_1 = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]
      expect(arr_1.my_transpose).to eq(exc_1)
      expect(exc_1.my_transpose).to eq(arr_1)
    end
  end
end

describe "Stock Picker" do
  it "picks the profitable pair of days to first buy and then sell stock" do
    expect(stock_picker([1000, 2000, 1500, 500, 4000, 5500, 3000, 1000, 4000, 5000])).to eq([3, 5])
  end
end

describe "Towers of Hanoi" do
  
end
