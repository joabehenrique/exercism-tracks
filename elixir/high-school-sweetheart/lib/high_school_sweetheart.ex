defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.at(0)
  end

  def initial(name) do
    name
    |> first_letter()
    |> String.upcase()
    |> String.pad_trailing(2, ".")
  end

  def initials(full_name) do
    full_name
    |> String.split()
    |> format_name()
  end

  def pair(full_name1, full_name2) do
    fr = full_name1 |> initials()
    ls = full_name2 |> initials()

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{fr}  +  #{ls}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end

  defp format_name([first_name, last_name]), do: "#{initial(first_name)} #{initial(last_name)}"
end
