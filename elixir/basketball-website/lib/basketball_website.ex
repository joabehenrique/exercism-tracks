defmodule BasketballWebsite do
  def extract_from_path(data, path),
    do: Enum.reduce(String.split(path, "."), data, fn valor, data -> data[valor] end)

  def get_in_path(data, path),
    do: data |> Kernel.get_in(String.split(path, "."))
end
