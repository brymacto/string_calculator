module Calculator

  def self.add(numbers)
    # numbers.split(",").map(&:to_i).reduce(0, :+)
    numbers.split(/[,\n]/).map(&:to_i).reduce(0, :+)
  end
end