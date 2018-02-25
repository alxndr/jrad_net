defmodule JradNet.UserTest do
  use JradNet.ModelCase

  alias JradNet.User

  @valid_attrs %{
    email: "some content",
    password: "some content",
    password_confirmation: "some content",
    username: "some content"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "password_digest value based on password" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert Comeonin.Bcrypt.checkpw(@valid_attrs.password, get_change(changeset, :password_digest))
  end

  test "when password is nil, password_digest value is not computed" do
    changeset = User.changeset(%User{}, %{@valid_attrs|password: nil})
    refute get_change(changeset, :password_digest)
  end

  test "when password confirmation is nil, password_digest value is not computed" do
    changeset = User.changeset(%User{}, %{@valid_attrs|password_confirmation: nil})
    refute get_change(changeset, :password_digest)
  end
end
