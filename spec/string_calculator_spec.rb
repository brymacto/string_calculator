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

    # it "raises exception when negative number used" do
    #   expect{ subject.add("1,-2,3,4")}.to raise_error
    # end

    it "raises 'negatives not allowed' exception when negative number used, including negatives" do
      # expect{ subject.add("1,-2,3,4")}.to raise_error(NegativesError, "negatives not allowed")
      expect{ subject.add("1,-2,3,4")}.to raise_error(NegativesError, "negatives not allowed: -2")
      expect{ subject.add("1,-2,-3,4")}.to raise_error(NegativesError, "negatives not allowed: -2, -3")
    end

  end

  describe "#get_regexp" do
    it "returns regexp given delimiter" do
      expect(subject.get_regexp("//;\n1;2")).to eql("[,\n;]")
    end
    it "returns original regexp given no delimiter" do
      expect(subject.get_regexp("1,1001,3")).to eql("[,\n]")
      expect(subject.get_regexp("1,2\n3")).to eql("[,\n]")
    end
  end

  describe "#get_delimiter" do
    it "determines custom delimiter" do
      expect(subject.get_delimiter("//;\n1;2")).to eql(';')
    end

    it "doesn't determine custom delimiter if not present" do
      expect(subject.get_delimiter(";\n1;2")).to eql(nil)
      expect(subject.get_delimiter("//;1;2")).to eql(nil)
    end
  end

  describe "#get_numbers" do
    it "returns numbers excluding delimiter" do
      expect(subject.get_numbers("//;\n1;2")).to eql("1;2")
    end

    it "returns original numbers if there is no delimiter" do
      expect(subject.get_numbers(";\n1;2")).to eql(";\n1;2")
      expect(subject.get_numbers("//;1;2")).to eql("//;1;2")
    end
  end
end


