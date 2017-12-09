defmodule JradNet.Set do
  use JradNet.Web, :model
  alias JradNet.{
    Repo,
    Show,
    SongPerformance,
  }

  schema "sets" do
    field :which,   :string
    belongs_to :show, Show
    has_many :song_performances, SongPerformance
    belongs_to :opener, SongPerformance

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:show_id, :opener_id, :which])
    |> validate_required([:show_id])
  end

  @doc """
  Return the Sets which were played in the given `show`.
  """
  @spec all_from_show(Show) :: [Set]
  def all_from_show(show) do
    (from set in __MODULE__,
      where: set.show_id == ^show.id,
      order_by: [asc: set.which]
    )
    |> load_songs
    |> Repo.all
  end

  def from_show(_show, nil), do: raise "unexpected nil"
  def from_show(show, which) do
    (from set in __MODULE__,
      where: set.show_id == ^show.id,
      where: set.which == ^which,
      limit: 1
    )
    |> Repo.one
  end

  @doc """
  Recursive function that orders the list according to a linked scheme between
  the `id` and `antecedent_id` properties of elements. The second parameter is
  a convenience dictionary.
  """
  def build_linked_list([head | _] = list, song_dict) do
    song_dict[head.id]
    |> case do
      nil -> # base case, we're done
        Enum.reverse(list)
      new_head -> # recurse
        build_linked_list([new_head | list], song_dict)
    end
  end

  def sort_linked_song_list(list, root) when length(list) <= 1, do: [root | list]
  def sort_linked_song_list(list, root) do
    # Assumes that the shape of list elements is %{:antecedent_id, :id}.
    # Doesn't care about orphans, only uses the first element without an antecedent.
    songs_by_antecedent = Enum.into(list, %{}, &({&1.antecedent_id, &1}));
    build_linked_list([root], songs_by_antecedent)
  end

  @doc """
  Put a set's songs in order.
  """
  def arrange_songs(set) do
    set = Repo.preload(set, [:show, :opener])
    set.opener
    |> Repo.preload(:song)
    |> case do
      nil ->
        IO.puts "nnnnnnnnnnnnoope no opener"
        %{song_performances: [], which: set.which}
      opener ->
        IO.puts "yyyyyyyyyyyyyyyyes we have an opener"
        songs =
          opener
          |> SongPerformance.descendants
          |> Repo.all
          |> Repo.preload(:song)
          |> sort_linked_song_list(opener)
        %{song_performances: songs, which: set.which} # mega hacky
    end
  end

  @doc """
  Load the associated SongPerformances and Songs of a set query.
  """
  def load_songs(query) do
    from query, preload: [song_performances: :song]
  end

  @doc """
  A human-friendly name for a set within a show.
  """
  def pretty_name(which) when which === "1" or
                              which === "2" or
                              which === "3", do: "Set #{which}"
  def pretty_name(which) when which === "e1", do: "Encore"
  def pretty_name(which) when which === "e2", do: "Encore 2"
end
