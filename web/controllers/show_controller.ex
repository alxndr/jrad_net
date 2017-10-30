defmodule JradNet.ShowController do
  use JradNet.Web, :controller
  alias JradNet.{
    Repo,
    Set,
    Show,
  }

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id} = params) do
    show = Repo.get(Show, id)
    sets = Set.from_show(show)
    render conn, "show.html",
      show: show,
      sets: sets,
      id: id
  end
end
