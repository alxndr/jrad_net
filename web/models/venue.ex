defmodule JradNet.Venue do
  use JradNet.Web, :model
  alias JradNet.{
    Repo,
    Show,
  }

  schema "venues" do
    field :name, :string
    # TODO former names
    field :location, :string
    # TODO geolocate
    field :capacity, :string # TODO this should be an integer... http://nicolas-bettenburg.com/articles/scrubbing-get-params-with-phoenix/
    has_many :shows, Show

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :location, :capacity])
    |> validate_required([:name, :location])
  end

  def get(id), do: Repo.get!(__MODULE__, id)

  def get_with_shows(id) do
    # shows_query = from s in Show, order_by: [desc: s.date]
    __MODULE__
    |> Repo.get(id)
    |> Repo.preload(:shows)
    # |> order_by(shows: shows_query) # TODO order the shows
  end

  def order_by_location(venue_query) do
    from v in venue_query, order_by: [asc: v.location]
  end

  def friendly_name(venue), do: "#{venue.name}#{if venue.location, do: " (#{venue.location})"}"
end
