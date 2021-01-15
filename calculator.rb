require "rspec/autorun"


# calc = Calculator.new
# cal.add(5, 10) # => 15

class Calculator
  def add(a, b)
    a + b
  end
end

describe Calculator do
  describe "#add" do
    it "returns the sum of its two arguments" do
    calc = Calculator.new
    expect(calc.add(5, 10)).to  eq(15) 
    end

    it "return the sum of two different arguments" do
      calc = Calculator.new
      expect(calc.add(2,1)).to eq(3)  
    end
  end
end