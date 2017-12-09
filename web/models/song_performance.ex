alias JradNet.{
  Repo,
}

defmodule JradNet.SongPerformance do
  use JradNet.Web, :model
  use Arbor.Tree, foreign_key: :antecedent_id

  schema "song_performances" do
    belongs_to :set, JradNet.Set
    belongs_to :song, JradNet.Song
    belongs_to :antecedent, JradNet.SongPerformance
    # has_one :next, JradNet.SongPerformance, foreign_key: :antecedent_id
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
    set = Repo.preload(set, :song_performances)
    set.song_performances
    |> List.last
  end

end
