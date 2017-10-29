defmodule JradNet.ShowView do
  use JradNet.Web, :view

  def all_shows do
    JradNet.Repo.all JradNet.Show
  end

end
