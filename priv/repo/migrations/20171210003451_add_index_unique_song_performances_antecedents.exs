defmodule JradNet.Repo.Migrations.AddIndexUniqueSongPerformancesAntecedents do
  use Ecto.Migration

  def change do
    drop index(:song_performances, [:antecedent_id])
    create unique_index(:song_performances, [:antecedent_id])
  end
end
