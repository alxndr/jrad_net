defmodule JradNet.VenueControllerTest do
  use JradNet.ConnCase

  alias JradNet.Venue
  @valid_attrs %{capacity: 42, location: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, venue_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing venues"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, venue_path(conn, :new)
    assert html_response(conn, 200) =~ "New venue"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, venue_path(conn, :create), venue: @valid_attrs
    assert redirected_to(conn) == venue_path(conn, :index)
    assert Repo.get_by(Venue, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, venue_path(conn, :create), venue: @invalid_attrs
    assert html_response(conn, 200) =~ "New venue"
  end

  test "shows chosen resource", %{conn: conn} do
    venue = Repo.insert! %Venue{}
    conn = get conn, venue_path(conn, :show, venue)
    assert html_response(conn, 200) =~ "Show venue"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, venue_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    venue = Repo.insert! %Venue{}
    conn = get conn, venue_path(conn, :edit, venue)
    assert html_response(conn, 200) =~ "Edit venue"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    venue = Repo.insert! %Venue{}
    conn = put conn, venue_path(conn, :update, venue), venue: @valid_attrs
    assert redirected_to(conn) == venue_path(conn, :show, venue)
    assert Repo.get_by(Venue, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    venue = Repo.insert! %Venue{}
    conn = put conn, venue_path(conn, :update, venue), venue: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit venue"
  end

  test "deletes chosen resource", %{conn: conn} do
    venue = Repo.insert! %Venue{}
    conn = delete conn, venue_path(conn, :delete, venue)
    assert redirected_to(conn) == venue_path(conn, :index)
    refute Repo.get(Venue, venue.id)
  end
end
