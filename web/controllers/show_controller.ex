defmodule JradNet.ShowController do
  use JradNet.Web, :controller
  alias JradNet.{
    Set,
    Show,
  }

  def index(conn, _params) do
    shows = Repo.all(JradNet.Show)
    render conn, "index.html", shows: shows
  end


  def show(conn, %{"id" => id}) do
    show = Repo.get(Show, id)
    sets = Set.from_show(show)
    render conn, "show.html",
      show: show,
      sets: sets,
      id: id
  end

  def edit(conn, %{"id" => id}) do
    show = Repo.get!(Show, id)
    changeset = Show.changeset(show)
    render conn, "edit.html", show: show, changeset: changeset
  end

  def update(conn, %{"id" => id, "show" => show_params}) do
    show = Repo.get!(Show, id)
    changeset = Show.changeset(show, show_params)
    case Repo.update(changeset) do
      {:ok, show} ->
        conn
        |> put_flash(:info, "Show updated successfully.")
        |> redirect(to: show_path(conn, :show, show))
      {:error, changeset} ->
        render conn, "edit.html", show: show, changeset: changeset
    end
  end
end
