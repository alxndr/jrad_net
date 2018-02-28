defmodule JradNet.LayoutViewTest do
  use JradNet.ConnCase, async: true

  alias JradNet.{
    LayoutView,
    User,
  }

  setup do
    %User{}
    |> User.changeset(%{username: "test", password: "test", password_confirmation: "test", email: "test@test.test"})
    |> Repo.insert()
    {:ok, conn: build_conn()}
  end

  test "when user is logged in, current_user/1 returns the user", %{conn: conn} do
    conn = post(conn, session_path(conn, :create), user: %{username: "test", password: "test"})
    assert LayoutView.current_user(conn).username == "test"
  end

  test "when no user data in session, current_user/1 returns nil", %{conn: conn} do
    user = Repo.get_by(User, %{username: "test"})
    conn = delete(conn, session_path(conn, :delete, user))
    refute LayoutView.current_user(conn)
  end
end
