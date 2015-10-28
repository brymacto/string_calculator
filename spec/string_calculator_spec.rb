require_relative '../string_calculator'

describe Calculator do
  describe "#add" do
    it "returns zero for empty string" do
      expect(subject.add('')).to eql(0)
    end

    it "returns sum given numbers" do
      expect(subject.add('1')).to eql(1)
      expect(subject.add('1,2')).to eql(3)
      expect(subject.add("1,2,3,4")).to eql(10)
    end

    it "supports new line or comma as separator" do
      expect(subject.add("1,2\n3")).to eql(6)
    end

    it "ignores numbers bigger than one thousand" do
      expect(subject.add("1,999,3")).to eql(1003)
      expect(subject.add("1,1000,3")).to eql(1004)
      expect(subject.add("1,1001,3")).to eql(4)
    end

    it "supports custom delimiters" do
      expect(subject.add("//;\n1;2")).to eql(3)
      expect(subject.add("//%\n1%2%4")).to eql(7)
    end

    it "supports custom delimiters of any length" do
      expect(subject.add("//***\n2***4")).to eql(6)
    end

    it "raises 'negatives not allowed' exception when negative number used, including negatives" do
      expect{ subject.add("1,-2,3,4")}.to raise_error(NegativesError, "negatives not allowed: -2")
      expect{ subject.add("1,-2,-3,4")}.to raise_error(NegativesError, "negatives not allowed: -2, -3")
    end

    it "supports multiple custom delimiters" do
      expect(subject.add("//[;][xx]\n1;2xx3")).to eql(6)
      expect(subject.add("//[*][xx][yyy]\n1*2xx3yyy7")).to eql(13)
    end

  end

  
end


