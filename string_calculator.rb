class Calculator

  def get_delimiter(input_string)
    if input_string.index("//") == 0
      endpoint = input_string.index("\n").to_i - 2
      input_string[2,endpoint]
    else
      nil
    end
  end

  def add(numbers)
    numbers.split(/[,\n]/).map(&:to_i).reject{ |num| num > 1000 }.reduce(0, :+)
  end
end


