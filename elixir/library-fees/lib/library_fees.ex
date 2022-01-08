defmodule LibraryFees do
  @time_noon ~T[12:00:00]

  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: NaiveDateTime.to_time(datetime) < @time_noon

  def return_date(checkout_datetime) do
    checkout_datetime |> before_noon?() |> add_date(checkout_datetime)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> calc_diff()
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> is_monday?()
  end

  def calculate_late_fee(checkout, return, rate) do
    updated_checkout = checkout |> datetime_from_string |> return_date

    result = days_late(updated_checkout, datetime_from_string(return)) * rate

    if monday?(datetime_from_string(return)), do: trunc(result / 2), else: result
  end

  defp is_monday?(date) when date != 1, do: false
  defp is_monday?(_date), do: true

  defp calc_diff(result) when result < 0, do: 0
  defp calc_diff(result), do: result

  defp add_date(true, date), do: date |> NaiveDateTime.to_date() |> Date.add(28)
  defp add_date(false, date), do: date |> NaiveDateTime.to_date() |> Date.add(29)
end
