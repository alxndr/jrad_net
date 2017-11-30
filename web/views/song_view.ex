defmodule JradNet.SongView do
  use JradNet.Web, :view

  def title("index.html", _), do: "Songs"
  def title(_, _), do: nil

end
