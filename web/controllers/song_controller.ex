defmodule JradNet.SongController do
  use JradNet.Web, :controller

  def index(conn, _params) do
    songs = Repo.all(JradNet.Song)
    render conn, "index.html", songs: songs
  end
end
