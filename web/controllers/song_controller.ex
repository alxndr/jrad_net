defmodule JradNet.SongController do
  use JradNet.Web, :controller
  alias JradNet.{
    Song,
    User,
  }

  plug :authorize_user when action in [:new, :create, :update, :edit, :delete]

  def index(conn, _params) do
    current_user = get_session(conn, :current_user)
    songs =
      Song
      |> Repo.all
      |> Repo.preload(:song_performances)
    render(conn, "index.html", songs: songs, current_user: current_user)
  end

  def new(conn, _params) do
    changeset = Song.changeset(%Song{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"song" => song_params}) do
    %Song{}
    |> Song.changeset(song_params)
    |> Repo.insert
    |> case do
      {:ok, _venue} ->
        conn
        |> put_flash(:info, "Song created successfully.")
        |> redirect(to: song_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    current_user = get_session(conn, :current_user)
    song = Song.get_with_shows(id)
    performances = song.song_performances
    render(conn, "show.html", song: song, performances: performances || [], current_user: current_user)
  end

  def edit(conn, %{"id" => id}) do
    song = Song.get(id)
    changeset = Song.changeset(song)
    render conn, "edit.html", song: song, changeset: changeset
  end

  defp authorize_user(conn, _) do
    # TODO share across controllers
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
end
