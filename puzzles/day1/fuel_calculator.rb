class FuelCalculator

  def initialize(modules_file)
    @modules_file = modules_file
  end

  def fuel_total
    @modules_file.each_line.inject(0) { |total, line| total += fuel_for(weight(line)) }
  end

  private

  def fuel_for(weight)
    (weight / 3).round - 2
  end

  def weight(line)
    Integer(line.chomp)
  end

end
