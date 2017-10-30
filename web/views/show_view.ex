defmodule JradNet.ShowView do
  use JradNet.Web, :view
  use Timex
  alias JradNet.{
    Repo,
    Show,
  }

  def all_shows do
    Repo.all Show
  end

  def readable_date(show) do
    "#{mdy(show.date)} at Venue in Location"
  end

  def mdy(naive_datetime), do: Timex.format!(naive_datetime, "{M}/{D}/{YY}")
end
