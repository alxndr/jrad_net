defmodule JradNet.Set do
  use JradNet.Web, :model

  schema "sets" do
    field :which,   :string
    belongs_to :show, JradNet.Show

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date, :show_id])
    |> validate_required([:date, :show_id])
  end
end
