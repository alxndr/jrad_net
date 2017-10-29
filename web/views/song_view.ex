defmodule JradNet.SongView do
  use JradNet.Web, :view

  def all_songs do
    JradNet.Repo.all JradNet.Song
  end

end
