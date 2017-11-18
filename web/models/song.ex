defmodule JradNet.Song do
  use JradNet.Web, :model
  alias JradNet.{
    Repo,
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

  def get(id), do: Repo.get!(__MODULE__, id)
end
