defmodule TakeANumber do
  def start() do
    spawn(fn -> looping(0) end)
  end

  defp looping(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        looping(state)

      {:take_a_number, sender_pid} ->
        send(sender_pid, state = state + 1)
        looping(state)

      :stop ->
        nil

      _other_cases ->
        looping(state)
    end
  end
end
