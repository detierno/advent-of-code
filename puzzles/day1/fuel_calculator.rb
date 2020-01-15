class FuelCalculator

  def initialize(modules_file)
    @modules_file = modules_file
  end

  def fuel_total
    @modules_file.each_line.inject(0) { |total, line| total += fuel_for(weight(line)) }
  end

  private

  def fuel_for(weight)
    base_fuel = fuel_for_weight(weight)
    base_fuel + fuel_for_fuel(base_fuel)
  end

  def fuel_for_fuel(fuel_weight)
    fuel_total = 0
    fuel       = fuel_for_weight(fuel_weight)

    while fuel > 0
      fuel_total += fuel
      fuel = fuel_for_weight(fuel)
    end

    fuel_total
  end

  def fuel_for_weight(weight)
    (weight / 3).round - 2
  end

  def weight(line)
    Integer(line.chomp)
  end

end
