defmodule JradNet.PageController do
  use JradNet.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
