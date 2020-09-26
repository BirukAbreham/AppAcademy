require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("browine", 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("browine")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("browine", "5", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    subject(:dessert) { Dessert.new("brownie", 10, chef) }
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("sugar")
      expect(dessert.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    subject(:dessert) { Dessert.new("vanilla-icecream", 10, chef) }
    it "shuffles the ingredient array" do
      dessert.add_ingredient("vanilla")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("cream")
      dessert.mix!
      expect(dessert.ingredients).to_not contain_exactly(["vanilla", "sugar", "cream"])
    end
  end

  describe "#eat" do
    subject(:dessert) { Dessert.new("vanilla-icecream", 10, chef) }
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect(dessert.quantity).to eq(10-5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ dessert.eat(11) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    let(:chef) { double("chef", :titleize => "Chef Biruk the Great baker") }
    subject(:dessert) { Dessert.new("ice-cream", 10, chef) }
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to eq("Chef Biruk the Great baker has made 10 ice-creams!")
    end
  end

  describe "#make_more" do
    # let(:dessert) { Dessert.new("ice-cream", 10, chef)}
    # let(:chef) { double("chef", :bake => { dessert.heat!, dessert.add_ingredient("sugar", "cream", "milk") })}
    it "calls bake on the dessert's chef with the dessert passed in" do
    end
  end
end
