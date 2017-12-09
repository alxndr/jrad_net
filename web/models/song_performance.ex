alias JradNet.{
  Repo,
  Set,
}

defmodule JradNet.SongPerformance do
  use JradNet.Web, :model
  use Arbor.Tree, foreign_key: :antecedent_id

  schema "song_performances" do
    belongs_to :set, Set
    belongs_to :song, JradNet.Song
    belongs_to :antecedent, __MODULE__
    field :position, :integer # what number. unique to set, not song
    # variants: duo, instrumental, jam, part #, reprise, solo, spoken, verse #, ... can have multiple?
    # ...theme is just part of the actual song if it's a TV tune or whatever...
    # ...but tease/quote should be a reference to another SongPerformance
    # TODO: free-form notes; guest performer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:set_id, :song_id, :antecedent_id, :position])
    |> validate_required([:set_id, :song_id])
    # unique position by set...
    # |> unique_constraint(:position, name: :song_performances_position_set_id)
    # ?
    # https://hexdocs.pm/ecto/Ecto.Changeset.html#unique_constraint/3
  end

  def get(id), do: Repo.get!(__MODULE__, id)

  def last_from_set(set) do
    set = Repo.preload(set, :opener)
    case set.opener do
      nil -> nil
      opener ->
        opener
        |> __MODULE__.descendants
        |> Repo.all
        |> List.last
        |> case do
          nil -> opener # only one song has been played
          last_track -> last_track
        end
    end
  end

  def all_openers do
    # of all sets, including encores
    __MODULE__.roots
    |> Repo.all
  end

  def preload_encores(perf_query) do
    encores_query = from(set in Set, where: ilike(set.which, "e%"))
    perf_query
    |> Repo.preload(set: encores_query)
  end

  def preload_sets(perf_query) do
    sets_query = from(set in Set, where: not ilike(set.which, "e%")) # TODO this will include soundchecks
    perf_query
    |> Repo.preload(set: sets_query)
  end

  def last_inserted do
    __MODULE__
    |> Ecto.Query.order_by([sp], desc: sp.inserted_at)
    |> Ecto.Query.limit(1)
    |> Repo.one
  end
end
