defmodule GigalixirGettingStarted.Repo.Migrations.CreateSong do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :name, :string
      add :shortname, :string
      add :author, :string

      timestamps()
    end

  end
end
