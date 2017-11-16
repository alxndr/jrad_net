defmodule JradNet.Repo.Migrations.CreateVenue do
  use Ecto.Migration

  def up do
    create table(:venues) do
      add :name, :string
      add :location, :string
      add :capacity, :string
      timestamps()
    end
    create index(:venues, [:name])

    alter table(:shows) do
      add :venue_id, references(:venues, on_delete: :nothing)
    end
    create index(:shows, [:venue_id])
  end

  def down do
    alter table(:shows) do
      remove :venue_id
    end
    drop table(:venues)
  end
end
