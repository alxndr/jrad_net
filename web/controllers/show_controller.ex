defmodule GigalixirGettingStarted.ShowController do
  use GigalixirGettingStarted.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
