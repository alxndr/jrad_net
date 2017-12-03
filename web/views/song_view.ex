defmodule JradNet.SongView do
  use JradNet.Web, :view
  alias JradNet.{
    Show,
    Song,
    Venue,
  }

  def title("index.html", _), do: "Songs"
  def title("show.html", %{conn: %{assigns: %{song: song}}}), do: Song.readable_name(song)
  def title("edit.html", %{conn: %{assigns: %{song: song}}}), do: "Editing: #{Song.readable_name(song)}"
  def title(_, _), do: nil

  def friendly_name(venue), do: Venue.friendly_name(venue)

  def readable_date(show), do: Show.readable_date(show)

end
