defmodule DateParser do
  @days_names "(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday)"
  @moth_names "(January|February|March|April|May|June|July|August|September|October|November|December)"

  def day(), do: "[0-9]{1,2}"

  def month(), do: "[0-9]{1,2}"

  def year(), do: "[0-9]{4,4}"

  def day_names(), do: @days_names

  def month_names(), do: @moth_names

  def capture_day(), do: "(?<day>#{day()})"

  def capture_month(), do: "(?<month>#{month()})"

  def capture_year(), do: "(?<year>#{year()})"

  def capture_day_name(), do: "(?<day_name>#{day_names()})"

  def capture_month_name(), do: "(?<month_name>#{month_names()})"

  def capture_numeric_date(),
    do: "^#{capture_day()}/#{capture_month()}/#{capture_year()}$"

  def capture_month_name_date(),
    do: "^#{capture_month_name()} #{capture_day()}, #{capture_year()}$"

  def capture_day_month_name_date(),
    do: "^#{capture_day_name()}, #{capture_month_name()} #{capture_day()}, #{capture_year()}$"

  def match_numeric_date(), do: Regex.compile!(capture_numeric_date())

  def match_month_name_date(), do: Regex.compile!(capture_month_name_date())

  def match_day_month_name_date(), do: Regex.compile!(capture_day_month_name_date())
end
