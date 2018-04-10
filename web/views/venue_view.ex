defmodule JradNet.VenueView do
  use JradNet.Web, :view
  alias JradNet.{
    Repo,
    Show,
    User,
    Venue,
  }

  def shows_for(venue) do
    v = Repo.preload(venue, :shows)
    v.shows
  end

  def readable_date(show), do: Show.readable_date(show)

  def title("index.html", _), do: "Venues"
  def title("new.html", _), do: "Add new venue"
  def title("show.html", %{conn: %{assigns: %{venue: venue}}}), do: Venue.friendly_name(venue)
  def title("edit.html", %{conn: %{assigns: %{venue: venue}}}), do: "Editing: #{Venue.friendly_name(venue)}"
  def title(_, _), do: nil

  def user_can(user, action), do: User.can(user, nil, action, nil)
end
