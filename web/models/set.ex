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
    |> cast(params, [:show_id, :which])
    |> validate_required([:show_id, :which])
  end
end
