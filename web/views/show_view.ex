defmodule JradNet.ShowView do
  use JradNet.Web, :view
  alias JradNet.{
    Show,
  }

  def readable_date(show), do: Show.readable_date(show)

  def title("index.html", _), do: "Shows"
  def title("new.html", _), do: "Add new show"
  def title("show.html", %{conn: %{assigns: %{show: show}}}), do: Show.friendly_name(show)
  def title("edit.html", %{conn: %{assigns: %{show: show}}}), do: "Editing: #{Show.friendly_name(show)}"
  def title(_, _), do: nil # would be nice if this base case were implemented elsewhere ✨
end
