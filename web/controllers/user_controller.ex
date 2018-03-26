defmodule JradNet.UserController do
  use JradNet.Web, :controller

  alias JradNet.User

  plug :authorize_user when action in [:delete]
  plug :authorize_self when action in [:update, :edit]

  def index(conn, _params) do
    current_user = get_session(conn, :current_user)
    users = Repo.all(User)
    render(conn, "index.html", users: users, current_user: current_user)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    current_user = get_session(conn, :current_user)
    user = Repo.get!(User, id)
    render(conn, "show.html", user: user, current_user: current_user)
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end

  defp authorize_user(conn, _) do
    user = get_session(conn, :current_user)
    cond do
      !user ->
        conn
        |> put_flash(:error, "gotta be logged in to do that")
        |> redirect(to: session_path(conn, :new))
        |> halt()
      User.can(user, conn.method, conn.path_info, conn.path_params) ->
        conn
      true ->
        conn
        |> put_flash(:error, "can't do that")
        |> redirect(to: page_path(conn, :index))
        |> halt()
    end
  end

  defp authorize_self(conn, _) do
    user_subject = get_session(conn, :current_user)
    user_object = Repo.get!(User, conn.params["id"])
    cond do
      !user_subject ->
        conn
        |> put_flash(:error, "gotta be logged in to do that")
        |> redirect(to: session_path(conn, :new))
        |> halt()
      user_subject.id == user_object.id ->
        conn
      User.can(user_subject, conn.method, conn.path_info, conn.path_params) ->
        conn
      true ->
        conn
        |> put_flash(:error, "can't do that")
        |> redirect(to: page_path(conn, :index))
        |> halt()
    end
  end
end
