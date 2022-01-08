defmodule FreelancerRates do
  @hourly_rate 8.0
  @monthly_rate 22

  @spec daily_rate(number) :: float
  def daily_rate(hourly_rate), do: hourly_rate * @hourly_rate

  @spec apply_discount(number, number) :: float
  def apply_discount(before_discount, discount),
    do: before_discount - before_discount * discount / 100

  @spec monthly_rate(number, number) :: integer
  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> discount_exists(discount)
    |> calc_monthly_rate(discount)
    |> ceil()
  end

  @spec days_in_budget(number, number, number) :: float
  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> calc_workdays(budget)
  end

  @spec discount_exists(number, number) :: {number, boolean}
  defp discount_exists(hourly_rate, discount), do: {hourly_rate, discount > 0}

  @spec calc_monthly_rate({number, boolean}, number) :: float
  defp calc_monthly_rate({hourly_rate, apply_discount}, discount),
    do: hourly_rate * @monthly_rate * (1 - ((apply_discount && 1) || 0) * discount / 100)

  @spec calc_workdays(number, integer) :: float
  defp calc_workdays(hourly_rate, budget), do: Float.floor(budget / hourly_rate, 1)
end
