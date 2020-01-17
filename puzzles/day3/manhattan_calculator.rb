class ManhattanCalculator

  attr_reader :input_a, :input_b

  def initialize(input_a, input_b)
    @input_a, @input_b = input_a.split(','), input_b.split(',')
  end

  def compute
  end

end
