defmodule JradNet.ShowControllerTest do
  use JradNet.ConnCase

  alias JradNet.Show
  @valid_attrs %{name: "Show name", author: "Show author", set_id: 3}
  @invalid_attrs %{}

  test "index: lists all entries on index", %{conn: conn} do
    conn = get conn, show_path(conn, :index)
    assert html_response(conn, 200) =~ "Shows"
  end

  @tag :skip
  test "new: renders form for new resources", %{conn: conn} do
    conn = get conn, show_path(conn, :new)
    assert html_response(conn, 200) =~ "New show"
  end

  @tag :skip
  test "create: creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, show_path(conn, :create), show: @valid_attrs
    assert redirected_to(conn) == show_path(conn, :index)
    assert Repo.get_by(Show, @valid_attrs)
  end

  @tag :skip
  test "create: does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, show_path(conn, :create), show: @invalid_attrs
    assert html_response(conn, 200) =~ "New show"
  end

  # @tag :skip # TODO fix this... only pull sets if there are performances
  # test "show: shows chosen resource", %{conn: conn} do
  #   show = Repo.insert! %Show{name: "Show Name"}
  #   conn = get conn, show_path(conn, :show, show)
  #   assert html_response(conn, 200) =~ "Show Name"
  # end
  #
  test "show: renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, show_path(conn, :show, -1)
    end
  end

  test "edit: renders form for editing chosen resource", %{conn: conn} do
    show = Repo.insert! %Show{}
    conn = get conn, show_path(conn, :edit, show)
    assert html_response(conn, 200) =~ "Edit show"
  end

  @tag :skip
  test "update: updates chosen resource and redirects when data is valid", %{conn: conn} do
    show = Repo.insert! %Show{}
    conn = put conn, show_path(conn, :update, show), show: @valid_attrs
    assert redirected_to(conn) == show_path(conn, :show, show)
    assert Repo.get_by(Show, @valid_attrs)
  end

  @tag :skip
  test "update: does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    show = Repo.insert! %Show{}
    conn = put conn, show_path(conn, :update, show), show: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit show"
  end

  @tag :skip
  test "delete: deletes chosen resource", %{conn: conn} do
    show = Repo.insert! %Show{}
    conn = delete conn, show_path(conn, :delete, show)
    assert redirected_to(conn) == show_path(conn, :index)
    refute Repo.get(Show, show.id)
  end
end
