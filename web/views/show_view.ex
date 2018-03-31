defmodule JradNet.ShowView do
  use JradNet.Web, :view
  alias JradNet.{
    Set,
    Show,
    Song,
    User,
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

  def user_can(user, action), do: User.can(user, nil, nil, nil)

  def venue_select_list(venues) do
    [
      {"...pick venue:", ""}
      |
      Enum.into(venues, [], &({"#{&1.location} — #{&1.name}", &1.id}))
    ]
  end

  def radio_button_values_for_sets do
    [
      # TODO {:which_0, "0"} # soundcheck
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

  def count_of_sets_and_encores(%Show{sets: sets}) when length(sets) == 0, do: 0
  def count_of_sets_and_encores(show) do
    grouped =
      show.sets
      |> Enum.group_by(&(if String.starts_with?(&1.which, "e"), do: :encores, else: :sets))
    if not is_nil(grouped[:encores]) && length(grouped[:encores]) > 0 do
      "#{length(grouped[:sets])}+#{length(grouped[:encores])}"
    else
      length(grouped[:sets])
    end
  end

  def accesskey_for_set(%{which: which}) when is_bitstring(which) do
    case which do
      "e1" -> "e"
      "e2" -> "f"
      should_be_an_integer_as_a_string ->
        should_be_an_integer_as_a_string
    end
  end
end
