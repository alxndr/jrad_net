alias JradNet.{
  Repo,
  Set,
  Song,
}

defmodule JradNet.SongPerformance do
  use JradNet.Web, :model
  use Arbor.Tree, foreign_key: :antecedent_id

  schema "song_performances" do
    belongs_to :set, Set
    belongs_to :song, Song
    belongs_to :antecedent, __MODULE__, on_replace: :nilify
    field :position, :integer # what number. unique to set, not song
    # variants: duo, instrumental, jam, part #, reprise, solo, spoken, verse #, ... can have multiple?
    # ...theme is just part of the actual song if it's a TV tune or whatever...
    # ...but tease/quote should be a reference to another SongPerformance
    field :notes, :string
    field :segue, :string # could be an enum... could also be a separate model
    # TODO: guest performer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:set_id, :song_id, :antecedent_id, :notes, :position, :segue])
    |> validate_required([:set_id, :song_id])
    |> unique_constraint(:antecedent_id)
    # https://hexdocs.pm/ecto/Ecto.Changeset.html#unique_constraint/3
  end

  def get(id), do: Repo.get!(__MODULE__, id)

  @doc """
  Recursive function that orders the list according to a linked scheme between
  the `id` and `antecedent_id` properties of elements. The second parameter is
  a convenience dictionary.
  """
  def build_linked_list([head | _] = list, song_dict) do
    case(song_dict[head.id]) do
      nil -> # base case, we're done
        Enum.reverse(list)
      new_head -> # recurse
        [new_head | list]
        |> build_linked_list(song_dict)
    end
  end

  def sort_linked_song_list(list, root) when length(list) <= 1, do: [root | list]
  def sort_linked_song_list(list, root) do
    # Assumes that the shape of list elements is %{:antecedent_id, :id}.
    # Doesn't care about orphans, only uses the first element without an antecedent.
    songs_by_antecedent = Enum.into(list, %{}, &({&1.antecedent_id, &1}));
    build_linked_list([root], songs_by_antecedent)
  end

  def with_all_following(song_performance) do
    song_performance
    |> __MODULE__.descendants
    |> Repo.all
    |> Repo.preload(:song)
    |> sort_linked_song_list(song_performance)
  end

  def last_from_set(set) do
    set = Repo.preload(set, :opener)
    case set.opener do
      nil -> nil
      opener ->
        opener
        |> with_all_following
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

  def swap_for(song_name) do
    song = Repo.get_by(Song, name: song_name)
    last_inserted()
    |> __MODULE__.changeset(%{song_id: song.id})
    |> Repo.update
  end
end
