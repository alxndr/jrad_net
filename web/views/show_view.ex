defmodule GigalixirGettingStarted.ShowView do
  use GigalixirGettingStarted.Web, :view

  def all_shows do
    GigalixirGettingStarted.Repo.all GigalixirGettingStarted.Show
  end

end
