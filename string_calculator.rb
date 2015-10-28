module Calculator

  def self.add(numbers)
    num_array = numbers.split(",")
    num_array.map! { |num| num.to_i }
    num_array.reduce(0,:+)
  end
end