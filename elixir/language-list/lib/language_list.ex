defmodule LanguageList do
  def new, do: []

  def add(list, language), do: [language | list]

  def remove(list) when length(list) >= 1, do: List.delete_at(list, 0)

  def first(list), do: List.first(list)

  def count(list), do: length(list)

  def exciting_list?(list), do: "Elixir" in list
end
