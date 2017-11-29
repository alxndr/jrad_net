defmodule JradNet.Show do
  use JradNet.Web, :model
  use Timex
  alias JradNet.{
    Repo,
  }

  schema "shows" do
    field :date, :naive_datetime
    belongs_to :venue, JradNet.Venue, on_replace: :update
    # TODO may be part of an Event (e.g. High Sierra, Songs of Love Benefit...)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    venue = case params["venue_id"] || struct.venue_id do
      nil -> %{} # or should these values be nil?
      v_id -> case Repo.get(Venue, v_id) do
        nil -> %{}
        v -> v
      end
    end
    struct
    |> Repo.preload(:venue)
    |> cast(params, [:date, :venue_id])
    |> Ecto.Changeset.put_assoc(:venue, venue)
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
