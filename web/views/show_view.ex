defmodule JradNet.ShowView do
  use JradNet.Web, :view
  alias JradNet.{
    Set,
    Show,
    Song,
  }

  def readable_date(show), do: Show.readable_date(show)

  def selected_venue_id(%{"id" => venue_id}), do: venue_id
  def selected_venue_id(nil), do: ""
  def selected_venue_id(_venue), do: ""

  def song_select_list(songs) do
    [
      {"...pick song:", ""}
      |
      Enum.into(songs, [], &({Song.readable_name(&1), &1.id}))
    ]
  end

  def title("index.html", _), do: "Shows"
  def title("new.html", _), do: "Add new show"
  def title("show.html", %{conn: %{assigns: %{show: show}}}), do: Show.friendly_name(show)
  def title("edit.html", %{conn: %{assigns: %{show: show}}}), do: "Editing: #{Show.friendly_name(show)}"
  def title(_, _), do: nil # would be nice if this base case were implemented elsewhere ✨

  def venue_select_list(venues) do
    [
      {"...pick venue:", ""}
      |
      Enum.into(venues, [], &({"#{&1.location} — #{&1.name}", &1.id}))
    ]
  end

  def radio_button_values_for_sets do
    [
      {:which_1, "1"},
      {:which_2, "2"},
      {:which_3, "3"},
      {:which_e1, "e1"},
      {:which_e2, "e2"},
    ]
  end

  def is_set_defined_in_show?(show, which_set) do
    show.sets
    |> Enum.find(&(&1.which === which_set))
    |> case do
      %Set{} -> true
      nil -> false
    end
  end

  def set_name(which), do: Set.pretty_name(which)
end
