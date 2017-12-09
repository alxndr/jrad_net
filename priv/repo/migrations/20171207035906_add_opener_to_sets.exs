defmodule JradNet.Repo.Migrations.AddOpenerToSets do
  use Ecto.Migration

  def change do
    alter table(:sets) do
      add :opener_id, references(:song_performances, on_delete: :nilify_all)
    end
    create index(:sets, [:opener_id])

    alter table(:song_performances) do
      add :antecedent_id, references(:song_performances, on_delete: :nothing)
    end
    create index(:song_performances, [:antecedent_id])
  end
end
