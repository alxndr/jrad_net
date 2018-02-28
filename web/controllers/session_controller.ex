defmodule JradNet.SessionController do
  use JradNet.Web, :controller
  alias JradNet.User
  import Comeonin.Bcrypt, only: [checkpw: 2]

  plug :scrub_params, "user" when action in [:create]

  @message_error_login "Invalid username or password."

  def new(conn, _params) do
    render conn, "new.html", changeset: User.changeset(%User{})
  end

  def create(conn, %{"user" => user_params}) do
    User
    |> Repo.get_by(username: user_params["username"])
    |> sign_in(user_params["password"], conn)
  end

  def sign_in(user, password, conn) when is_nil(user) or is_nil(password) do
    conn
    |> error_signing_in()
  end
  def sign_in(user, password, conn) do
    if checkpw(password, user.password_digest) do
      conn
      |> put_session(:current_user, %{id: user.id, username: user.username})
      |> put_flash(:info, "logged in")
      |> redirect(to: page_path(conn, :index))
    else
      conn
      |> error_signing_in()
    end
  end

  def error_signing_in(conn) do
    conn
    |> put_session(:current_user, nil)
    |> put_flash(:error, @message_error_login)
    |> redirect(to: page_path(conn, :index)) # TODO redirect to login page??
  end
end
