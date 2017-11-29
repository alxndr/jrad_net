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

  def order_by_location(venue_query) do
    from v in venue_query, order_by: [asc: v.location]
  end
end
