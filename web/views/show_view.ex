defmodule JradNet.ShowView do
  use JradNet.Web, :view
  alias JradNet.{
    Show,
    Venue,
  }

  def readable_date(show), do: Show.readable_date(show)

  def selected_venue_id(%{"id" => venue_id}), do: venue_id
  def selected_venue_id(nil), do: ""
  def selected_venue_id(_venue), do: ""

  def title("index.html", _), do: "Shows"
  def title("new.html", _), do: "Add new show"
  def title("show.html", %{conn: %{assigns: %{show: show}}}), do: Show.friendly_name(show)
  def title("edit.html", %{conn: %{assigns: %{show: show}}}), do: "Editing: #{Show.friendly_name(show)}"
  def title(_, _), do: nil # would be nice if this base case were implemented elsewhere ✨
end
