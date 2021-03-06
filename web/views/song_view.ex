defmodule JradNet.SongView do
  use JradNet.Web, :view
  alias JradNet.{
    Set,
    Show,
    Song,
    User,
    Venue,
  }

  def title("index.html", _), do: "Songs"
  def title("show.html", %{conn: %{assigns: %{song: song}}}), do: Song.readable_name(song)
  def title("edit.html", %{conn: %{assigns: %{song: song}}}), do: "Editing: #{Song.readable_name(song)}"
  def title(_, _), do: nil

  def venue_friendly_name(venue), do: Venue.friendly_name(venue)

  def set_friendly_name(set), do: Set.pretty_name(set.which)

  def readable_date(show), do: Show.readable_date(show)

  def user_can(user, action), do: User.can(user, nil, action, nil)
  def user_can(user, action, object), do: User.can(user, nil, action, object)
end
