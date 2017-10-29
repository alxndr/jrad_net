defmodule GigalixirGettingStarted.Repo.Migrations.CreateEverything do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :name,      :string
      add :shortname, :string
      add :author,    :string
      timestamps()
    end
    create index(:songs, [:name])
    create index(:songs, [:shortname])

    create table(:shows) do
      add :date, :naive_datetime
      timestamps()
    end

    create table(:sets) do
      add :which,   :string # soundcheck, 1, 2, 3, e, e2
      add :show_id, references(:shows, on_delete: :nothing)
      timestamps()
    end
    create index(:sets, [:show_id])

    create table(:song_performances) do
      add :set_id, references(:sets, on_delete: :nothing)
      add :song_id, references(:songs, on_delete: :nothing)
      add :position, :integer
      # unique position by set...
      # create unique_index(:song_performances, [:position, :set_id])
      # ?
      # https://hexdocs.pm/ecto/Ecto.Changeset.html#unique_constraint/3
      timestamps()
    end
    create index(:song_performances, [:song_id])
    create index(:song_performances, [:set_id])

  end
end
