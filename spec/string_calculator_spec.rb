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


    # it "supports custom delimiters" do
    #   expect(subject.add("//;\n1;2")).to eql(3)
    # end
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
  end
end


