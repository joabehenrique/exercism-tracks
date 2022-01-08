defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: Enum.sort_by(inventory, fn valor -> valor.price end)

  def with_missing_price(inventory),
    do: Enum.filter(inventory, fn valor -> is_nil(valor.price) end)

  def increase_quantity(item, count),
    do:
      Map.update!(item, :quantity_by_size, fn quantity ->
        quantity |> Enum.map(fn {k, v} -> {k, v + count} end) |> Enum.into(%{})
      end)

  def total_quantity(item),
    do: Enum.reduce(item[:quantity_by_size], 0, fn {_k, v}, acc -> v + acc end)
end
