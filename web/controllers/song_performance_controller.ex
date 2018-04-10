defmodule JradNet.SongPerformanceController do
  use JradNet.Web, :controller

  alias JradNet.{
    Repo,
    SongPerformance,
    User,
  }

  plug :authorize_user when action in [:new, :create, :update, :edit, :delete]

  def delete(conn, %{"id" => id}) do
    # TODO this doesn't handle the position value...
    track =
      SongPerformance
      |> Repo.get!(id)
      |> Repo.preload(:antecedent)
      |> Repo.preload(set: :show)
    show = track.set.show

    preceeding_track =
      track.antecedent
      |> Repo.preload(:song)
    following_track =
      track
      |> SongPerformance.children
      |> Repo.one
      |> Repo.preload(:song)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(track)

    if following_track && preceeding_track do # TODO handle other situations
      following_track
      |> SongPerformance.changeset(%{antecedent_id: preceeding_track.id})
      |> Ecto.Changeset.put_assoc(:antecedent, preceeding_track)
      |> Repo.insert!
    end

    conn
    |> put_flash(:info, "SongPerformance deleted successfully.")
    |> redirect(to: show_path(conn, :edit, show))
  end

  def edit(conn, %{"id" => id} = params) do
    song_performance =
      id
      |> SongPerformance.get()
      |> Repo.preload([set: :show])
    changeset = case song_performance.notes do
      nil -> # n.b. ellipsis is autofilled
        SongPerformance.changeset(song_performance)
        |> SongPerformance.changeset(%{notes: "..."})
      _notes ->
        SongPerformance.changeset(song_performance)
    end
    case Repo.update(changeset) do
      {:ok, song_performance} ->
        conn
        |> put_flash(:info, "Notes added.")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
        # TODO focus the field
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Error...")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
    end
  end


  def update(conn, %{"id" => id}) do
    song_performance =
      id
      |> SongPerformance.get()
      |> Repo.preload(set: :show)
    # changeset = SongPerformance.changeset(song_performance)
    changeset = case song_performance.notes do
      "" -> # n.b. setting notes to empty string will delete it
        SongPerformance.changeset(song_performance)
        |> SongPerformance.changeset(%{notes: nil})
      _notes ->
        SongPerformance.changeset(song_performance)
    end
    case Repo.update(changeset) do
      {:ok, song_performance} ->
        conn
        |> put_flash(:info, "Song Performance updated.")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Error updating song performance...")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
    end
  end

  defp authorize_user(conn, _) do
    # TODO share across controllers
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
