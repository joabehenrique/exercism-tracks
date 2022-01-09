# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{id: 0, registrations: []} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn agent -> agent.registrations end)
  end

  def register(pid, register_to) do
    current_id = Agent.get(pid, fn agent -> agent.id end)
    new_plot = %Plot{plot_id: current_id + 1, registered_to: register_to}

    Agent.update(pid, fn %{id: id, registrations: regs} ->
      %{registrations: regs ++ [new_plot], id: id + 1}
    end)

    new_plot
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn %{id: id, registrations: regs} ->
      %{id: id, registrations: Enum.reject(regs, fn plot -> plot.plot_id == plot_id end)}
    end)
  end

  def get_registration(pid, plot_id) do
    agent_exist = Enum.find(list_registrations(pid), fn agent -> agent.plot_id == plot_id end)

    if agent_exist, do: agent_exist, else: {:not_found, "plot is unregistered"}
  end
end
