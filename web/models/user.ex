defmodule JradNet.User do
  use JradNet.Web, :model

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
      |> put_change(:password_digest, Bcrypt.hash_pwd_salt(password))
    else
      changeset
    end
  end

  def can(nil, nil, nil, nil), do: false
  def can(nil, _, _, _), do: false
  def can(%{username: "crazyquilt"}, _method, _path_info, _path_params), do: true
  def can(%{id: id}, _method, :edit_user, %{id: id}), do: true
  def can(%{}, _method, _path_info, _path_params), do: false
  def can(_, _, _, _), do: false
end
