defmodule JradNet.SessionController do
  use JradNet.Web, :controller
  alias JradNet.User
  import Comeonin.Bcrypt, only: [checkpw: 2]

  plug :scrub_params, "user" when action in [:create]

  @message_error_login "Invalid username or password."

  def new(conn, _params) do
    render conn, "new.html", changeset: User.changeset(%User{})
  end

  def create(conn, %{"user" => %{"username" => username, "password" => password}})
  when not is_nil(username) and not is_nil(password) do
    User
    |> Repo.get_by(username: username)
    |> sign_in(password, conn)
  end
  def create(conn, _) do
    conn
    |> login_fail()
  end

  def sign_in(nil, _, conn), do: login_fail(conn)
  def sign_in(user, password, conn) do
    if checkpw(password, user.password_digest) do
      conn
      |> put_session(:current_user, %{id: user.id, username: user.username})
      |> put_flash(:info, "logged in")
      |> redirect(to: page_path(conn, :index))
    else
      conn
      |> login_fail()
    end
  end

  def login_fail(conn) do
    conn
    |> put_session(:current_user, nil) # diff b/t this and delete_sesion/1 ?
    |> put_flash(:error, @message_error_login)
    |> redirect(to: page_path(conn, :index)) # TODO redirect to login page??
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: page_path(conn, :index)) # TODO redirect to wherever you were when you clicked logout
  end
end
