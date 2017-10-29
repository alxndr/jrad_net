IO.puts "Aliasing JradNet.{ Repo, Set, Show, Song, SongPerformance }...\n"
alias JradNet.{
  Repo,
  Set,
  Show,
  Song,
  SongPerformance
}

defmodule EctoHelpers do
  defmacro __using__(_) do
    quote do
      IO.puts "\nimporting:\n  Ecto.Query.{ limit, select, where }\n  Ecto.Query.API.{ fragment }\n"
      import Ecto.Query, only: [limit: 2, select: 3, where: 3]
      import Ecto.Query.API, only: [fragment: 1]
      :ok
    end
  end
end
