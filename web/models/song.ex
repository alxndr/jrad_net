defmodule JradNet.Song do
  use JradNet.Web, :model
  alias JradNet.{
    SongPerformance,
  }

  schema "songs" do
    field :name, :string
    field :shortname, :string
    field :author, :string
    has_many :song_performances, SongPerformance

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :shortname, :author])
    |> validate_required([:name])
  end
end
