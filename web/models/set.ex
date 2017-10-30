defmodule JradNet.Set do
  use JradNet.Web, :model
  alias JradNet.Repo

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

  @doc """
  Return the Sets which were played in the given `show`.
  """
  def from_show(show) do
    (from set in __MODULE__,
      where: set.show_id == ^show.id
    )
    |> Repo.all
  end
end
