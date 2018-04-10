defmodule JradNet.Repo.Migrations.AddNotesToSongPerformances do
  use Ecto.Migration

  def change do
    alter table(:song_performances) do
      add :notes, :text
    end
  end
end
