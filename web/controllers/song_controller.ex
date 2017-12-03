defmodule JradNet.SongController do
  use JradNet.Web, :controller
  alias JradNet.{
    Song,
  }

  def index(conn, _params) do
    songs = Repo.all(Song)
            |> Repo.preload(:song_performances)
    render conn, "index.html", songs: songs
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
    song = Song.get_with_shows(id)
    performances = song.song_performances
    render conn, "show.html", song: song, performances: performances || []
  end

  def edit(conn, %{"id" => id}) do
    song = Song.get(id)
    changeset = Song.changeset(song)
    render conn, "edit.html", song: song, changeset: changeset
  end
end
