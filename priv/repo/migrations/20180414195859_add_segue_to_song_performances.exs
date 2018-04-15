defmodule JradNet.Repo.Migrations.AddSegueToSongPerformances do
  use Ecto.Migration

  def change do
    alter table(:song_performances) do
      add :segue, :text
    end
  end
end
