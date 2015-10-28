require_relative '../string_calculator'

describe Calculator do
  describe "#add" do
    it "returns zero for empty string" do
      sum = Calculator.add('')

      expect(sum).to eql(0)
    end
  end
end


