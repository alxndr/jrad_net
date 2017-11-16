defmodule JradNet.Venue do
  use JradNet.Web, :model

  schema "venues" do
    field :name, :string
    # TODO former names
    field :location, :string
    # TODO geolocate
    field :capacity, :string

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
end
