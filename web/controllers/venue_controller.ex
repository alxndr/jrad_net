defmodule JradNet.VenueController do
  use JradNet.Web, :controller # Repo
  alias JradNet.{
    Venue,
  }

  def index(conn, _params) do
    venues =
      Venue
      |> Ecto.Query.order_by([v], asc: v.location)
      |> Repo.all
      |> Repo.preload(:shows)
    render(conn, "index.html", venues: venues)
  end

  def new(conn, _params) do
    changeset = Venue.changeset(%Venue{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"venue" => venue_params}) do
    changeset = Venue.changeset(%Venue{}, venue_params)

    case Repo.insert(changeset) do
      {:ok, _venue} ->
        conn
        |> put_flash(:info, "Venue created successfully.")
        |> redirect(to: venue_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    venue = Repo.get!(Venue, id)
    render(conn, "show.html", venue: venue)
  end

  def edit(conn, %{"id" => id}) do
    venue = Venue.get(id)
    changeset = Venue.changeset(venue)
    render(conn, "edit.html", venue: venue, changeset: changeset)
  end

  def update(conn, %{"id" => id, "venue" => venue_params}) do
    venue = Repo.get!(Venue, id)
    changeset = Venue.changeset(venue, venue_params)

    case Repo.update(changeset) do
      {:ok, venue} ->
        conn
        |> put_flash(:info, "Venue updated successfully.")
        |> redirect(to: venue_path(conn, :show, venue))
      {:error, changeset} ->
        render(conn, "edit.html", venue: venue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    venue = Repo.get!(Venue, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(venue)

    conn
    |> put_flash(:info, "Venue deleted successfully.")
    |> redirect(to: venue_path(conn, :index))
  end
end
