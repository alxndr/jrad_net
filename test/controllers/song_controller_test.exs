defmodule JradNet.SongControllerTest do
  use JradNet.ConnCase

  alias JradNet.Song
  @valid_attrs %{name: "Song name", author: "Song author", set_id: 3}
  @invalid_attrs %{}

  test "index: lists all entries on index", %{conn: conn} do
    conn = get conn, song_path(conn, :index)
    assert html_response(conn, 200) =~ "All Songs"
  end

  @tag :skip
  test "new: renders form for new resources", %{conn: conn} do
    conn = get conn, song_path(conn, :new)
    assert html_response(conn, 200) =~ "New song"
  end

  @tag :skip
  test "create: creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, song_path(conn, :create), song: @valid_attrs
    assert redirected_to(conn) == song_path(conn, :index)
    assert Repo.get_by(Song, @valid_attrs)
  end

  @tag :skip
  test "create: does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, song_path(conn, :create), song: @invalid_attrs
    assert html_response(conn, 200) =~ "New song"
  end

  @tag :skip # TODO fix this... only pull sets if there are performances
  test "show: shows chosen resource", %{conn: conn} do
    song = Repo.insert! %Song{name: "Song Name"}
    conn = get conn, song_path(conn, :show, song)
    assert html_response(conn, 200) =~ "Song Name"
  end

  test "show: renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, song_path(conn, :show, -1)
    end
  end

  test "edit: renders form for editing chosen resource", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = get conn, song_path(conn, :edit, song)
    assert html_response(conn, 200) =~ "Edit song"
  end

  @tag :skip
  test "update: updates chosen resource and redirects when data is valid", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = put conn, song_path(conn, :update, song), song: @valid_attrs
    assert redirected_to(conn) == song_path(conn, :show, song)
    assert Repo.get_by(Song, @valid_attrs)
  end

  @tag :skip
  test "update: does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = put conn, song_path(conn, :update, song), song: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit song"
  end

  @tag :skip
  test "delete: deletes chosen resource", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = delete conn, song_path(conn, :delete, song)
    assert redirected_to(conn) == song_path(conn, :index)
    refute Repo.get(Song, song.id)
  end
end
