defmodule JradNet.SessionControllerTest do
  use JradNet.ConnCase
  alias JradNet.User

  setup do
    %User{}
    |> User.changeset(%{username: "test", password: "test", password_confirmation: "test", email: "test@test"})
    |> Repo.insert
    {:ok, conn: build_conn()}
  end

  test "shows the login form", %{conn: conn} do
    conn = get(conn, session_path(conn, :new))
    assert html_response(conn, 200) =~ "Log in"
  end

  test "with a valid user & password, creates a new user session", %{conn: conn} do
    conn = post(conn, session_path(conn, :create), user: %{username: "test", password: "test"})
    assert get_session(conn, :current_user)
    assert get_flash(conn, :info) == "logged in"
    assert redirected_to(conn) == page_path(conn, :index)
  end

  test "with a nonexistent username, does not create a session", %{conn: conn} do
    conn = post(conn, session_path(conn, :create), user: %{username: "wrong", password: "test"})
    refute get_session(conn, :current_user)
    assert get_flash(conn, :error) == "Invalid username or password."
    assert redirected_to(conn) == page_path(conn, :index)
  end

  test "with a wrong password, does not create a session", %{conn: conn} do
    conn = post(conn, session_path(conn, :create), user: %{username: "test", password: "wrong"})
    refute get_session(conn, :current_user)
    assert get_flash(conn, :error) == "Invalid username or password."
    assert redirected_to(conn) == page_path(conn, :index)
  end
end
