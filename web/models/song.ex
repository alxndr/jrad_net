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

  def readable_name(song) do
    if song.author do
      author = if song.author === "(trad)", do: "traditonal", else: song.author
      ~s'#{song.name} (#{author})'
    else
      song.name
    end
  end

  def get(id), do: Repo.get!(__MODULE__, id)

  def get_with_shows(id) do
    # TODO order performances by the show date...
    __MODULE__
    |> Repo.get!(id)
    |> Repo.preload([{:song_performances, [{:set, [{:show, :venue}]}]}])
  end

  def order_by_name(song_query) do
    from song in song_query, order_by: [asc: song.name]
  end
end
