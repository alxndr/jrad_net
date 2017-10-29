defmodule GigalixirGettingStarted.SongPerformance do
  use GigalixirGettingStarted.Web, :model

  schema "song_performances" do
    belongs_to :set, GigalixirGettingStarted.Set
    belongs_to :song, GigalixirGettingStarted.Song
    field :position, :integer # what number. unique to set, not song
    # variants: duo, instrumental, jam, part #, reprise, solo, spoken, verse #, ... can have multiple?
    # ...theme is just part of the actual song if it's a TV tune or whatever...
    # ...but tease/quote should be a reference to another SongPerformance

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:set_id, :song_id, :position])
    |> validate_required([:set_id, :song_id, :position])
    # unique position by set...
    # |> unique_constraint(:position, name: :song_performances_position_set_id)
    # ?
    # https://hexdocs.pm/ecto/Ecto.Changeset.html#unique_constraint/3
  end
end
