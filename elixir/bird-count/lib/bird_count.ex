defmodule BirdCount do
  def today(list), do: if(length(list) > 0, do: hd(list), else: nil)

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail] = list) when length(list) > 0, do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?(list) when hd(list) != 0, do: has_day_without_birds?(tl(list))
  def has_day_without_birds?(_list), do: true

  def total(list), do: calc_total(list, 0)

  def busy_days(list), do: calc_busy_days(list, 0)

  defp calc_total([], count), do: count

  defp calc_total(list, count) do
    count = count + hd(list)
    calc_total(tl(list), count)
  end

  defp calc_busy_days([], count), do: count

  defp calc_busy_days(list, count) when hd(list) >= 5 do
    count = count + 1
    calc_busy_days(tl(list), count)
  end

  defp calc_busy_days(list, count), do: calc_busy_days(tl(list), count)
end
