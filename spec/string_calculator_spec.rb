require_relative '../string_calculator'

describe Calculator do
  describe "#add" do
    it "returns zero for empty string" do
      sum = Calculator.add('')

      expect(sum).to eql(0)
    end

    it "returns sum given single number" do
      sum = Calculator.add('1')

      expect(sum).to eql(1)
    end

    it "returns sum given two numbers" do
      sum = Calculator.add('1,2')
      sum2 = Calculator.add('2,2')

      expect(sum).to eql(3)
      expect(sum2).to eql(4)
    end

    it "returns sum given four numbers" do
      sum = Calculator.add("1,2,3,4")

      expect(sum).to eql(10)
    end

    it "returns sum given string containing comma and new line as separators" do
      sum = Calculator.add("1,2\n3")

      expect(sum).to eql(6)
    end

    it "ignores numbers bigger than one thousand" do
      sum = Calculator.add("1,1002,3")

      expect(sum).to eql(4)
    end
  end
end


