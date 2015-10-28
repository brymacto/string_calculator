require_relative '../string_calculator'

describe Calculator do
  describe "#add" do
    it "returns zero for empty string" do
      sum = Calculator.add('')

      expect(sum).to eql(0)
    end

    it "returns sum given number" do
      sum = Calculator.add('1')

      expect(sum).to eql(1)
    end
  end
end


