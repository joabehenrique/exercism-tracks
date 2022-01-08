defmodule Username do
  def sanitize(''), do: ''

  def sanitize([head | tail]) do
    case head do
      head when head in ?a..?z -> [head]
      ?_ -> '_'
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> ''
    end ++ sanitize(tail)
  end
end
