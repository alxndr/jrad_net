defmodule JradNet.ShowController do
  use JradNet.Web, :controller
  alias JradNet.{
    Set,
    Show,
    Venue,
  }

  def index(conn, _params) do
    shows =
      JradNet.Show
      |> Ecto.Query.order_by([s], desc: s.date)
      |> Repo.all
      |> Repo.preload(:venue) # ...or something
    render conn, "index.html", shows: shows
  end


  def show(conn, %{"id" => id}) do
    show =
      Show
      |> Repo.get(id)
      |> Repo.preload(:venue)
    sets = Set.from_show(show)
    render conn, "show.html",
      show: show,
      sets: sets,
      venue: show.venue,
      id: id
  end

  def edit(conn, %{"id" => id}) do
    show = Show.get_with_venue(id)
    changeset = Show.changeset(show)
    all_venues =
      Venue
      |> Venue.order_by_location
      |> Repo.all
    render conn, "edit.html",
      show: show,
      changeset: changeset,
      all_venues: all_venues
  end

  def update(conn, %{"id" => id, "show" => show_params}) do
    show = Show.get_with_venue(id)
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
