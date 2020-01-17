Code.require_file("fuel_calculator.exs")

ExUnit.start()

defmodule FuelCalculatorTest do
  use ExUnit.Case, async: true

  setup do

    on_exit(fn ->
      File.rm("test.txt")
    end)

  end

  test 'module weight is 12' do
    File.write("test.txt", "12")
    result = FuelCalculator.fuel_total("test.txt")
    assert result ==  2
  end

  test 'module weight is 1969' do
    File.write("test.txt", "1969")
    result = FuelCalculator.fuel_total("test.txt")
    assert result ==  966
  end

  test 'module weight is 100756' do
    File.write("test.txt", "100756")
    result = FuelCalculator.fuel_total("test.txt")
    assert result ==  50346
  end
end
