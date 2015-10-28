class Calculator

  def get_delimiter(input_string)
    if input_string.index("//") == 0
      endpoint = input_string.index("\n").to_i - 2
      input_string[2,endpoint]
    else
      nil
    end
  end

  def get_numbers(input_string)
    delimiter = get_delimiter(input_string)
    if delimiter
      input_string[3 + delimiter.length, input_string.length]
    else
      input_string
    end
  end

  def get_regexp(input_string)
    "[,\n;#{get_delimiter(input_string)}]"
  end

  def add(input_string)
    if get_delimiter(input_string)
      numbers = get_numbers(input_string)
    else
      numbers = input_string
    end
    numbers.split(/[,\n]/).map(&:to_i).reject{ |num| num > 1000 }.reduce(0, :+)
  end
end


