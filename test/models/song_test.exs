defmodule JradNet.SongTest do
  use JradNet.ModelCase

  alias JradNet.Song

  @valid_attrs %{author: "some content", name: "some content", shortname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Song.changeset(%Song{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Song.changeset(%Song{}, @invalid_attrs)
    refute changeset.valid?
  end
end
