defmodule JradNet.User do
  use JradNet.Web, :model
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_digest, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :password, :password_confirmation])
    |> validate_required([:username, :email, :password, :password_confirmation])
    |> hash_password()
  end

  @doc """
  Generates a hash from the password and puts it into the changeset as password_digest.
  """
  def hash_password(changeset) do
    password = get_change(changeset, :password)
    confirmation = get_change(changeset, :password_confirmation)
    if password && confirmation && password == confirmation do
      changeset
      |> put_change(:password_digest, hashpwsalt(password))
    else
      changeset
    end
  end
end
