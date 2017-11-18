defmodule JradNet.ShowView do
  use JradNet.Web, :view
  alias JradNet.{
    Repo,
    Show,
  }

  def readable_date(show), do: Show.readable_date(show)
end
