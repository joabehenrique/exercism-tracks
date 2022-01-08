defmodule KitchenCalculator do
  def get_volume({_unit, value}), do: value

  def to_milliliter({unit, value}), do: {:milliliter, value * calc_unit(unit)}

  def from_milliliter({_unit_mill, value}, unit), do: {unit, value / calc_unit(unit)}

  def convert({unit, value}, unit_return),
    do: {unit_return, value * calc_unit(unit) / calc_unit(unit_return)}

  defp calc_unit(unit) do
    case unit do
      :milliliter -> 1
      :cup -> 240
      :fluid_ounce -> 30
      :teaspoon -> 5
      :tablespoon -> 15
    end
  end
end
