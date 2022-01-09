defmodule Newsletter do
  def read_emails(path), do: path |> File.read!() |> file_empty?()

  def open_log(path), do: path |> File.open!([:write])

  def log_sent_email(pid, email), do: IO.puts(pid, email)

  def close_log(pid), do: File.close(pid)

  def send_newsletter(emails_path, log_path, send_fun) do
    pid = open_log(log_path)

    emails_path
    |> read_emails()
    |> Enum.each(fn email ->
      if send_fun.(email) == :ok, do: log_sent_email(pid, email)
    end)

    close_log(pid)
  end

  defp file_empty?(""), do: []
  defp file_empty?(content), do: content |> String.trim() |> String.split("\n")
end
