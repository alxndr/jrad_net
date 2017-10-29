defmodule JradNet.SetTest do
  use JradNet.ModelCase

  alias JradNet.Set

  @valid_attrs %{date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Set.changeset(%Set{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Set.changeset(%Set{}, @invalid_attrs)
    refute changeset.valid?
  end
end
