defmodule NameBadge do
  def print(id, name, nil),
    do: if(!is_nil(id), do: "[#{id}] - #{name} - OWNER", else: "#{name} - OWNER")

  def print(id, name, department),
    do:
      if(!is_nil(id),
        do: "[#{id}] - #{name} - #{String.upcase(department)}",
        else: "#{name} - #{String.upcase(department)}"
      )
end
