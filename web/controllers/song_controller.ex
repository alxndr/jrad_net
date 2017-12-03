defmodule JradNet.SongController do
  use JradNet.Web, :controller
  alias JradNet.{
    Song,
  }

  def index(conn, _params) do
    songs = Repo.all(JradNet.Song)
    render conn, "index.html", songs: songs
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
