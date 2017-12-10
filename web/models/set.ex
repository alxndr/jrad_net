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
  Put a set's songs in order.
  """
  def arrange_songs(set) do
    set = Repo.preload(set, [:show, :opener])
    set.opener
    |> Repo.preload(:song)
    |> case do
      nil ->
        %{song_performances: [], which: set.which}
      opener ->
        songs = SongPerformance.with_all_following(opener)
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
