defmodule JradNet.Repo.Migrations.AddNotesToShows do
  use Ecto.Migration

  def change do
    alter table(:shows) do
      add :notes, :text
    end
  end
end
