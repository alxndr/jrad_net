defmodule JradNet.ShowView do
  use JradNet.Web, :view
  use Timex
  alias JradNet.{
    Repo,
    Show,
  }

  def readable_date(show) do
    mdy(show.date)
  end

  def mdy(naive_datetime), do: Timex.format!(naive_datetime, "{M}/{D}/{YY}")
end
