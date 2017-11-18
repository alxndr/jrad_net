defmodule JradNet.Show do
  use JradNet.Web, :model
  use Timex
  alias JradNet.{
    Repo,
  }

  schema "shows" do
    field :date, :naive_datetime
    belongs_to :venue, JradNet.Venue

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date, :venue_id])
    |> validate_required([:date])
  end

  def get(id), do: Repo.get!(__MODULE__, id)

  @doc """
  Add a venue to a show.
  """
  def add_venue(show, venue) do
    show
    |> Repo.preload(:venue)
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:venue, venue)
    |> Repo.update
  end

  @doc """
  A human-readable way of representing the date of the show.
  """
  def readable_date(show) do
    Timex.format!(show.date, "{M}/{D}/{YY}")
  end

  def get_with_venue(id) do
    __MODULE__
    |> Repo.get!(id)
    |> Repo.preload(:venue)
  end
end
