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
    show
    |> Show.changeset(show_params)
    |> Repo.update
    |> case do
      {:ok, show} ->
        flash_message = if show_params["venue_id"] do
          venue = case show_params["venue_id"] do # this is not so idiomatic...
            nil -> nil
            "" -> nil
            venue_id -> case Repo.get(Venue, venue_id) do
              nil -> nil
              venue -> venue
            end
          end
          if venue do # could probably use `with` for this
            show
            |> Repo.preload(:venue)
            |> Show.changeset(%{})
            |> Ecto.Changeset.put_assoc(:venue, venue)
            |> Repo.update
            |> case do
              {:ok, show} -> "Show/venue updated successfully."
              {:error, changeset} ->
                IO.puts ~s[
                  !!!!! could not associate show #{show.id} and venue #{venue.id}
                  !!!!! changeset:
                  !!!!! #{inspect changeset}
                ]
                "Show updated successfully, but could not associate new venue: #{venue.id}"
            end
          else
            "Show updated successfully."
          end
        else
          "Show updated successfully."
        end
        conn
        |> put_flash(:info, flash_message)
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
