defmodule HighScore do
  @initial_score 0

  def new, do: %{}

  def add_player(scores, name, score \\ @initial_score), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(%{}, name), do: Map.put(%{}, name, @initial_score)
  def reset_score(scores, name), do: Map.update!(scores, name, &(&1 * @initial_score))

  def update_score(scores, name, score) do
    case(Map.has_key?(scores, name)) do
      true -> Map.update!(scores, name, &(&1 + score))
      false -> add_player(scores, name, score)
    end
  end

  def get_players(scores), do: Map.keys(scores)
end
