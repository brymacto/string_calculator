module Calculator

  def self.add(numbers)
    if (!numbers.include? ',')
      numbers.to_i
    else
      num_array = numbers.split(",")
      num_array.map! { |num| num.to_i }
      num_array.reduce(:+)
    end
  end
end