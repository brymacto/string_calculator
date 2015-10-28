class Calculator

  def add(numbers)
    numbers.split(/[,\n]/).map(&:to_i).reject{ |num| num > 1000 }.reduce(0, :+)
  end
end


