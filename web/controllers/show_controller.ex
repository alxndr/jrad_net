defmodule JradNet.ShowController do
  use JradNet.Web, :controller
  alias JradNet.{
    Set,
    Show,
    Venue,
  }

  def index(conn, _params) do
    shows =
      Show
      |> Ecto.Query.order_by([s], desc: s.date)
      |> Repo.all
      |> Repo.preload(:venue) # ...or something
    render conn, "index.html", shows: shows
  end

  def new(conn, _params) do
    changeset =
      Show.changeset(%Show{})
    all_venues =
      Venue
      |> Venue.order_by_location
      |> Repo.all
    render conn, "new.html", changeset: changeset, all_venues: all_venues
  end

  def create(conn, %{"show" => show_params}) do
    all_venues =
      Venue
      |> Venue.order_by_location
      |> Repo.all
    %Show{}
    |> Show.changeset(show_params)
    |> Repo.insert
    |> case do
      {:ok, _show} ->
        conn
        |> put_flash(:info, "Show created")
        |> redirect(to: show_path(conn, :index)) # TODO mark the new show somehow
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset, all_venues: all_venues
    end
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
    venue = case show_params["venue_id"] do
      nil -> nil
      "" -> nil
      venue_id -> case Repo.get(Venue, venue_id) do
        nil -> nil
        venue -> venue
      end
    end
    show
    |> Repo.preload(:venue)
    |> Show.changeset(show_params)
    |> Ecto.Changeset.put_assoc(:venue, venue) # doing this here rather than the show changeset...
    |> Repo.update
    |> case do
      {:ok, show} ->
        conn
        |> put_flash(:info, "Show updated successfully.")
        |> redirect(to: show_path(conn, :show, show))
      {:error, changeset} ->
        all_venues =
          Venue
          |> Venue.order_by_location
          |> Repo.all
        render conn, "edit.html",
          show: show,
          changeset: changeset,
          all_venues: all_venues
    end
  end
end
