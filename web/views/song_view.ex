defmodule GigalixirGettingStarted.SongView do
  use GigalixirGettingStarted.Web, :view

  def all_songs do
    GigalixirGettingStarted.Repo.all GigalixirGettingStarted.Song
  end

end
