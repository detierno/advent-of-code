defmodule FuelCalculator do

  def fuel_total(module_file) do
    File.read!(module_file)
    |> String.split("\n")
    |> Enum.map(fn line ->
      {mass, _} = Integer.parse(line)
      mass
    end)
    |> Enum.map(&total_fuel/1)
    |> Enum.sum
  end

  def total_fuel(mass) do
    case fuel(mass) do
      needed when needed > 0 ->
        needed + total_fuel(needed)

      _ ->
        0
    end
  end

  def fuel(mass) do
    div(mass, 3) - 2
  end
end

