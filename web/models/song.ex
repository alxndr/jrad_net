defmodule GigalixirGettingStarted.Song do
  use GigalixirGettingStarted.Web, :model

  schema "songs" do
    field :name, :string
    field :shortname, :string
    field :author, :string

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
