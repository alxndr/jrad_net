defmodule JradNet.SongPerformanceController do
  use JradNet.Web, :controller

  alias JradNet.{
    Repo,
    Show,
    SongPerformance,
    User,
  }

  plug :authorize_user when action in [:new, :create, :update, :edit, :delete]

  def delete(conn, %{"id" => id}) do
    # TODO this doesn't handle the position value...
    track =
      SongPerformance
      |> Repo.get!(id)
      |> Repo.preload(:song)
      |> Repo.preload(:antecedent)
      |> Repo.preload(set: :show)
    preceeding_track = Repo.preload(track.antecedent, :song)
    track
    |> SongPerformance.changeset(%{antecedent_id: nil})
    |> Ecto.Changeset.put_assoc(:antecedent, nil)
    |> Repo.update!
    following_track =
      track
      |> SongPerformance.children
      |> Repo.one
      |> Repo.preload(:antecedent)
      |> Repo.preload(:song)
    an_arbitrary_track =
      cond do
        !is_nil(following_track) && !is_nil(preceeding_track) ->
          # Deleting from middle of setlist...
          following_track
          |> Repo.preload(:set) # ...dunno why
          |> SongPerformance.changeset(%{antecedent_id: preceeding_track.id})
          |> Ecto.Changeset.put_assoc(:antecedent, preceeding_track)
          |> Repo.update!
        following_track ->
          # Deleting opener...
          # The following track's antecedent must be cleared.
          following_track
          |> SongPerformance.changeset(%{antecedent_id: nil})
          |> Ecto.Changeset.put_assoc(:antecedent, nil)
          |> Repo.insert!
          # The set must be updated to use the following track as the opener.
          track.set
          |> Repo.preload(:opener)
          |> Set.changeset(%{opener_id: following_track.id})
          |> Ecto.Changeset.put_assoc(:opener, following_track)
          |> Repo.insert!
        preceeding_track ->
          # Deleting last track in setlist... no-op.
          preceeding_track
        true ->
          # Deleting only track in the setlist...
          # The set's opener must be cleared.
          track.set
          |> Repo.preload(:opener)
          |> Set.changeset(%{opener_id: nil})
          |> Ecto.Changeset.put_assoc(:opener, nil)
          |> Repo.insert!
          track
      end
    case an_arbitrary_track do
      nil ->
        IO.puts inspect an_arbitrary_track
        throw "ruh roh!!!"
      _an_arbitrary_track ->
        Repo.delete!(track) # if this doesn't work, something is fubar
        conn
        |> put_flash(:info, "SongPerformance deleted successfully.")
        |> redirect(to: show_path(conn, :edit, track.set.show))
    end
  end

  def edit(conn, %{"add" => "segue", "id" => id} = params) do
    song_performance =
      id
      |> SongPerformance.get()
      |> Repo.preload([set: :show])
    changeset =
      song_performance
      |> SongPerformance.changeset()
      |> SongPerformance.changeset(%{segue: ">"})
    case Repo.update(changeset) do
      {:ok, song_performance} ->
        conn
        |> put_flash(:info, "Segue added.")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
        # TODO focus the field
      {:error, changeset} ->
        IO.puts inspect changeset
        conn
        |> put_flash(:error, "Error adding segue...")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
    end
  end
  def edit(conn, %{"add" => "notes", "id" => id} = params) do
    song_performance =
      id
      |> SongPerformance.get()
      |> Repo.preload([set: :show])
    changeset =
      song_performance
      |> SongPerformance.changeset()
      |> SongPerformance.changeset(%{notes: "..."}) # TODO pull this into a separate def edit/2
    case Repo.update(changeset) do
      {:ok, song_performance} ->
        conn
        |> put_flash(:info, "Notes added.")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
        # TODO focus the field
      {:error, changeset} ->
        IO.puts inspect changeset
        conn
        |> put_flash(:error, "Error adding notes...")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
    end
  end
  def edit(conn, %{"id" => id} = params) do
    song_performance =
      id
      |> SongPerformance.get()
      |> Repo.preload([set: :show])
    changeset = SongPerformance.changeset(song_performance)
    case Repo.update(changeset) do
      {:ok, song_performance} ->
        conn
        |> put_flash(:info, "Song performance updated.")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
        # TODO focus the field
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Error...")
        |> redirect(to: show_path(conn, :edit, song_performance.set.show))
    end
  end

  def update(conn, %{"id" => id, "song_performance" => song_performance_params}) do
    song_performance =
      id
      |> SongPerformance.get()
      |> Repo.preload(set: :show)
    changeset = case song_performance.notes do
      "" -> # n.b. setting notes to empty string should delete it
        song_performance
        |> SongPerformance.changeset()
        |> SongPerformance.changeset(%{notes: nil})
      notes ->
        song_performance
        |> SongPerformance.changeset(song_performance_params)
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
