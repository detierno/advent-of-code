require_relative 'fuel_calculator'

modules = File.open(File.join(File.dirname(__FILE__), 'input'))
p FuelCalculator.new(modules).fuel_total
