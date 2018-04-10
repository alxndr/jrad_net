defmodule JradNet.ShowController do
  use JradNet.Web, :controller
  alias JradNet.{
    Set,
    Show,
    Song,
    SongPerformance,
    User,
    Venue,
  }

  plug :authorize_user when action in [:new, :create, :update, :edit, :delete]
  # TODO how to provide this to the view layer... then we can not even show the links

  def index(conn, _params) do
    current_user = get_session(conn, :current_user)
    shows = Show.all_with_venue_and_sets()
    render conn, "index.html", shows: shows, current_user: current_user
  end

  def new(conn, _params) do
    changeset = Show.changeset(%Show{})
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
      {:ok, show} ->
        conn
        |> put_flash(:info, "Show created! Add some sets and then songs.")
        |> redirect(to: show_path(conn, :edit, show))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset, all_venues: all_venues
    end
  end

  def show(conn, %{"id" => id}) do
    current_user = get_session(conn, :current_user)
    show = Show.get_with_venue_and_sets(id)
    sets = Enum.map(show.sets, &Set.arrange_songs/1)
    render conn, "show.html",
      current_user: current_user,
      show: show,
      sets: sets,
      venue: show.venue,
      id: id
  end

  def edit(conn, %{"id" => id}) do
    show = Show.get_with_venue_and_sets(id)
    sets = Enum.map(show.sets, &Set.arrange_songs/1)
    changeset = Show.changeset(show)
    all_songs =
      Song
      |> Song.order_by_name
      |> Repo.all
    all_venues =
      Venue
      |> Venue.order_by_location
      |> Repo.all
    current_user = get_session(conn, :current_user)
    render conn, "edit.html",
      show: show,
      sets: sets,
      changeset: changeset,
      all_songs: all_songs,
      all_venues: all_venues,
      current_user: current_user
  end

  def update(conn, %{"id" => id, "show" => show_params} = params) do
    show = Show.get_with_venue_and_sets(id)
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
              {:ok, _show} -> "Show/venue updated successfully."
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
        # TODO these could be separate &update/2 definitions
        if show_params["new_set"] && show_params["which"] do
          Repo.insert!(%Set{which: show_params["which"], show: show})
        end
        if show_params["new_song_id"] && params["new_song"]["set"] do
          # this should probably all be in SongPerformance
          new_song = Song.get(show_params["new_song_id"])
          set = Set.from_show(show, params["new_song"]["set"])
          SongPerformance.last_from_set(set)
          |> case do
            nil ->
              opener =
                %SongPerformance{}
                |> SongPerformance.changeset(%{position: 1, song_id: new_song.id, set_id: set.id})
                |> Ecto.Changeset.put_assoc(:song, new_song)
                |> Ecto.Changeset.put_assoc(:set, set)
                |> Repo.insert!
              set
              |> Repo.preload(:opener)
              |> Set.changeset(%{})
              |> Ecto.Changeset.put_assoc(:opener, opener)
              |> Repo.update!
            last_track ->
              position = last_track.position + 1
              %SongPerformance{}
              |> SongPerformance.changeset(%{position: position, song_id: new_song.id, set_id: set.id, antecedent: last_track.id})
              |> Ecto.Changeset.put_assoc(:song, new_song)
              |> Ecto.Changeset.put_assoc(:set, set)
              |> Ecto.Changeset.put_assoc(:antecedent, last_track)
              |> Repo.insert!
          end
        end
        conn
        |> put_flash(:info, flash_message)
        |> redirect(to: show_path(conn, :edit, show))
      {:error, changeset} ->
        all_songs =
          Song
          |> Song.order_by_name
          |> Repo.all
        all_venues =
          Venue
          |> Venue.order_by_location
          |> Repo.all
        render conn, "edit.html",
          show: show,
          changeset: changeset,
          all_songs: all_songs,
          all_venues: all_venues
    end
  end

  defp authorize_user(conn, _) do
    user = get_session(conn, :current_user)
    cond do
      !user ->
        conn
        |> put_flash(:error, "gotta be logged in to do that")
        |> redirect(to: session_path(conn, :new))
        |> halt()
      User.can(user, conn.method, conn.path_info, conn.path_params) ->
        conn
      true ->
        conn
        |> put_flash(:error, "can't do that")
        |> redirect(to: page_path(conn, :index))
        |> halt()
    end
  end
end
