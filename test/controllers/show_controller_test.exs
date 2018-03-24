defmodule JradNet.ShowControllerTest do
  use JradNet.ConnCase

  alias JradNet.{
    Show,
    User,
  }
  @valid_attrs %{date: ~N[2015-07-05 17:30:00]}
  @invalid_attrs %{}

  @fake_admin %{id: 1, username: "crazyquilt"}

  setup do
    conn =
      build_conn()
      |> Plug.Test.init_test_session(current_user: @fake_admin)
    {:ok, conn: conn}
  end

  test "index: lists all entries on index", %{conn: conn} do
    conn = get conn, show_path(conn, :index)
    assert html_response(conn, 200) =~ "Shows"
  end

  test "new: renders form for new resources", %{conn: conn} do
    conn = get conn, show_path(conn, :new)
    assert html_response(conn, 200) =~ "New show"
  end

  test "create: creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, show_path(conn, :create), show: @valid_attrs
    show = Repo.get_by(Show, @valid_attrs)
    assert show
    assert redirected_to(conn) == show_path(conn, :edit, show.id)
  end

  test "create: does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, show_path(conn, :create), show: @invalid_attrs
    assert html_response(conn, 200) =~ "New show"
  end

  @tag :skip
  test "show: shows chosen resource", %{conn: conn} do
    show = Repo.insert! %Show{}
    conn = get conn, show_path(conn, :show, show)
    assert html_response(conn, 200) =~ "Show Name"
  end

  test "show: renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, show_path(conn, :show, -1)
    end
  end

  test "edit: renders form for editing chosen resource", %{conn: conn} do
    show = Repo.insert! %Show{date: ~N[2015-07-05 17:30:00]}
    conn = get(conn, show_path(conn, :edit, show))
    assert html_response(conn, 200) =~ "Edit show"
  end

  test "update: updates chosen resource and redirects when data is valid", %{conn: conn} do
    show = Repo.insert! %Show{}
    conn = put conn, show_path(conn, :update, show), show: @valid_attrs
    assert redirected_to(conn) == show_path(conn, :edit, show)
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
