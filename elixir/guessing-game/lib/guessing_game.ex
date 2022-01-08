defmodule GuessingGame do
  def compare(secret_number, guess) when is_integer(guess), do: response(guess - secret_number)
  def compare(_secret_number, _guess), do: "Make a guess"
  def compare(_secret_number), do: "Make a guess"

  defp response(result) when abs(result) == 1, do: "So close"
  defp response(result) when result == 0, do: "Correct"
  defp response(result) when result > 1, do: "Too high"
  defp response(result) when result < 1, do: "Too low"
end
