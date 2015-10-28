class Calculator
  attr_reader :input_string

  def add(input_string)
    @input_string = input_string

    check_for_negatives! parse

    parse.reject{ |num| num > 1000 }.reduce(0, :+)
  end

  private

  def parse
    numbers.split(delimiters).map(&:to_i)
  end

  def check_for_negatives!(numbers)
    negatives = numbers.select { |number| number < 0 }
    raise NegativesError, "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end

  def numbers
    if custom_delimiters
      input_string[3 + custom_delimiters.length, input_string.length]
    else
      input_string
    end
  end

  def delimiters
    Regexp.new "[,\n#{custom_delimiters}]"
  end

  def custom_delimiters
    if input_string.index("//") == 0
      endpoint = input_string.index("\n").to_i - 2
      input_string[2,endpoint]
    else
      nil
    end
  end
end

class NegativesError < StandardError

end
