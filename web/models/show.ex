defmodule JradNet.Show do
  use JradNet.Web, :model
  alias JradNet.Repo

  schema "shows" do
    field :date, :naive_datetime
    # TODO venues

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date])
    |> validate_required([:date])
  end
end
