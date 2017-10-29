defmodule Tasks do  
  def migrate do
    {:ok, _} = Application.ensure_all_started(:jrad_net)

    path = Application.app_dir(:jrad_net, "priv/repo/migrations")

    Ecto.Migrator.run(JradNet.Repo, path, :up, all: true)

    :init.stop()
  end
end  
