defmodule JradNet.VenueView do
  use JradNet.Web, :view
  alias JradNet.{
    Repo,
    Show,
  }

  def shows_for(venue) do
    v = Repo.preload(venue, :shows)
    v.shows
  end

  def readable_date(show), do: Show.readable_date(show)
end
